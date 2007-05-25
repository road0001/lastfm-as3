package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class FriendsData extends AbstractUserData {
		
		
		function FriendsData(user:String) {
			super(user);
			
			_properties['friends'] = new Array();
			BASE_URL += "friends.xml";
		}
		
		override protected function parseData(evt:Event):void {
			super.parseData(evt);
			for each (var item:XML in _svcXML..user) {
				var user:Object = { 'name':item.@username,
								    'image':item.image,
								    'url':item.url };
				_properties.friends.push(user);
			}
			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get friends():Array {
			return _properties['friends'];
		}
		
	}
	
}