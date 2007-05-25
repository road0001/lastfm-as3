package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class TopTagsData extends AbstractUserData {
		
		function TopTagsData(user:String) {
			super(user);
			_properties['tags'] = new Array();
			BASE_URL += "tags.xml";
		}
		
		
		override protected function parseData(evt:Event):void {
			super.parseData(evt);
			for each (var item:XML in _svcXML..tag) {
				var tag:Object = { 'name':item.name,
								   'count':Number(item.count),
								   'url':item.url };
				_properties.tags.push(tag);
			}
			
			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get tags():Array {
			return _properties['tags'];
		}
		
	}
	
}