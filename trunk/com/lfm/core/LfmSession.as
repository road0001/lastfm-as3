package com.lfm.core {	
	
	import com.gsolo.encryption.MD5;
	import flash.events.Event;
	import com.lfm.LfmEvents;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;


	public class LfmSession extends EventDispatcher {
		
		[Event(name="sessionSuccess", type="Events.SessionReadyEvent")]
		[Event(name="sessionFail", type="Events.SessionReadyEvent")]
		
		private static const HANDSHAKE_URL:String = "http://post.audioscrobbler.com/";
		private var lfm_user:String;
		private var lfm_pass:String;
		private var lfm_session:Object = new Object();
		

		function LfmSession(user:String,pass:String) {
			clear_session();
			this.username = user;
			this.password = pass;
		}
		
		
		private function handshake():void {
			var junk:Number = Math.random()*123456;
			var post_vars:URLVariables = new URLVariables();
			post_vars['hs'] = "true";
			post_vars['p'] = "1.2";
			post_vars['c'] = "tst";
			post_vars['v'] = "1";
			post_vars['u'] = this.lfm_user;
			var timestamp:Date = new Date();
			post_vars['t'] = Math.floor(timestamp.getTime()/1000);
			post_vars['a'] = MD5.encrypt(this.lfm_pass + Math.floor(timestamp.getTime()/1000));
			post_vars['junk'] = junk;
			
			var shake_request:URLRequest = new URLRequest(HANDSHAKE_URL);
			var shake_loader:URLLoader = new URLLoader();
			shake_request.data = post_vars;
			shake_request.method = URLRequestMethod.POST;
			shake_loader.addEventListener(Event.COMPLETE,parse_response);
			shake_loader.load(shake_request);
		}
		
		private function parse_response(e:Event):void {
			var loader:URLLoader = URLLoader(e.target);
			var response:Array = new Array();
			clear_session();
			response = loader.data.split("\n");
			var stat:String = response[0].split(" ",1)[0];
			
			switch(stat) {
				case "UPTODATE":
					lfm_session.status = "UPTODATE";
					lfm_session.id = response[1];
					lfm_session.np_url = response[2];
					lfm_session.post_url = response[3];
					lfm_session.success = true;
					break;
				case "OK":
					lfm_session.status = "OK";
					lfm_session.id = response[1];
					lfm_session.np_url = response[2];
					lfm_session.post_url = response[3];
					lfm_session.success = true;
					break;
				case "UPDATE":
					lfm_session.status = "UPTODATE";
					lfm_session.id = response[1];
					lfm_session.np_url = response[2];
					lfm_session.post_url = response[3];
					lfm_session.success = true;
					break;
				case "FAILED":
					lfm_session.status = "FAILED";
					lfm_session.reason = response[0].substr(response[0].indexOf(" ")+1);
					lfm_session.success = false;
					break;
				case "BADUSER":
					lfm_session.status = "BADUSER";
					lfm_session.success = false;
					break;
				case "BADTIME":
					lfm_session.status = "BADTIME";
					lfm_session.success = false;
					break;
			}
			
			var sessionEvt:Event;
			if(this.success) {
				sessionEvt = new Event("sessionSuccess"); }
			else {
				sessionEvt = new Event("sessionFail"); }
			this.dispatchEvent( sessionEvt );
		}
		
		private function clear_session():void {
			lfm_session = { status:"",
							id:"",
							post_url:"",
							np_url:"",
							interval:1,
							success:false };
		}
		
		
		public function set username(user:String):void {
			lfm_user = user;
		}
		public function set password(pass:String):void {
			lfm_pass = MD5.encrypt(pass);
		}
		
		public function get username():String {
			return lfm_user;
		}
		public function get password():String {
			return lfm_pass;
		}
		public function get status():String {
			return lfm_session.status;
		}
		public function get interval():Number {
			return lfm_session.interval;
		}
		public function get success():Boolean {
			return lfm_session.success;
		}
		public function get id():String {
			return lfm_session.id;
		}
		public function get reason():String {
			return lfm_session.reason;
		}
		public function get postURL():String {
			return lfm_session.post_url;
		}
		public function get npURL():String {
			return lfm_session.np_url;
		}
		public function get updateURL():String {
			return lfm_session.update_url;
		}
		
		public function create():void {
			this.handshake();
		}
		
	}
	
	
}