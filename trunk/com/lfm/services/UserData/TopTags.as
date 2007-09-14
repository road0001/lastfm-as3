package com.lfm.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.UserData.AbstractUserData;
	
	public class TopTags extends AbstractUserData {
		
		public function TopTags(user:String) {
			super(user);
			_properties['tags'] = new Array();
			BASE_URL += "tags.xml";
		}
		
		
		override protected function parseData(event:Event):void {
			super.parseData(event);
			for each (var item:XML in _svcXML..tag) {
				var tag:Object = { 'name':item.name,
								   'count':Number(item.count),
								   'url':item.url };
				_properties['tags'].push(tag);
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get tags():Array {
			return _properties['tags'];
		}
		
	}
	
}