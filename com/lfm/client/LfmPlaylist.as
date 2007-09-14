package com.lfm.core.services {	
	
	import com.dynamicflash.util.Base64;
	import flash.events.Event;
	//import com.lfm.LfmEvents;
	import flash.events.*;
	import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	
	
	public class LfmPlaylist extends EventDispatcher {
		
		private var _resourceID:String;
		private var _resourceType:String = "9";
		private var BASE_URL:String = "http://ext.last.fm/1.0/webclient/getresourceplaylist.php";
		
		private var _plist:Object = { version:1,
									 title:"",
									 creator:"",
									 allflp:'',
									 tracks:new Array() };
		
		function LfmPlaylist(rid:String="0",rtyp:String="9") {
			this.resourceID = rid;
			this.resourceType = rtyp;
		}
		
		public function load():void {
			var post_vars:URLVariables = new URLVariables();
			post_vars['resourceID'] = _resourceID;
			post_vars['resourceType'] = _resourceType;
			
			var request:URLRequest = new URLRequest(BASE_URL);
			var loader:URLLoader = new URLLoader();
			request.data = post_vars;
			request.method = URLRequestMethod.GET;
			loader.addEventListener(Event.COMPLETE,parse_response);
			loader.addEventListener(ProgressEvent.PROGRESS,onProgress);
			loader.load(request);
		}
		
		private function set resourceID(id:String):void {
			_resourceID = id;
		}
		private function set resourceType(id:String):void {
			_resourceType = id;
		}
		
		private function parse_response(evt:Event):void {
			var svcXML:XML = new XML(this.decodeResponse(evt.target.data));
			_plist.version = svcXML.@version;
			_plist.title = svcXML.title;
			_plist.creator = svcXML.creator;
			_plist.allflp = svcXML.allflp;
			for each (var item:XML in svcXML..track) {
				var track:Object = { location: item.location.toString(),
									 title: item.title.toString(),
									 album: item.album.toString(),
									 creator: item.creator.toString(),
									 duration: Number(item.duration),
									 image: item.image.toString(),
									 auth: item.trackauth.toString(),
									 fullduration: Number(item.fullduration),
									 links:{ artistpage:'',
									 		 albumpage:'',
											 trackpage:'',
											 buyTrackURL:'',
											 buyAlbumURL:'',
											 freeTrackURL:''} };
				for each (var link:XML in item..link) {
					
					switch(link.@rel.toString()) {
						case "http://www.last.fm/artistpage":
							track.links.artistpage = link.toString();
							break;
						case "http://www.last.fm/albumpage":
							track.links.albumpage = link.toString();
							break;
						case "http://www.last.fm/trackpage":
							track.links.trackpage = link.toString();
							break;
						case "http://www.last.fm/buyTrackURL":
							track.links.buyTrackURL = link.toString();
							break;
						case "http://www.last.fm/buyAlbumURL":
							track.links.buyAlbumURL = link.toString();
							break;
						case "http://www.last.fm/freeTrackURL":
							track.links.freeTrackURL = link.toString();
							break;
					}//end switch
				}//end for (link)
				
				_plist.tracks.push(track);
			}//end for (item)
			
			dispatchEvent(new Event(Event.COMPLETE));
			
		}
		
		private function decodeResponse(resp:String):String {
			resp = Base64.decode(resp);
			resp = unescape(resp.replace(/\+/g," "));
			resp = resp.replace(/lastfm\:/gi,"");
			trace(resp);
			return resp;
		}
		
		
		
		public function loadTrackFromPage(url:String):void {
			var request:URLRequest = new URLRequest(url);
			var loader:URLLoader = new URLLoader();
			request.method = URLRequestMethod.GET;
			loader.addEventListener(Event.COMPLETE,parsePage);
			loader.load(request);
		}
		
		private function parsePage(evt:Event):void {
			var pattern:RegExp = new RegExp("Embed This Track\\:", "i");
			var hasPreview:Array = pattern.exec(evt.target.data);
			if(!hasPreview) 
				return;
			pattern = new RegExp("resourceID=(.*)&resourceType=(.*)", "i");
			var resource:Array = pattern.exec(evt.target.data);
			if(!resource)
				return;
			this.resourceID = resource[1];
			this.load();
		}
		
		
		private function onProgress(evt:ProgressEvent):void {
			dispatchEvent(evt);
		}
		
		
		public function get tracks():Array {
			return _plist.tracks;
		}
		
	}


}