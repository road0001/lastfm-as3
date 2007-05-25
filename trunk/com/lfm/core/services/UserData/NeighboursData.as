package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class NeighboursData extends AbstractUserData {
		
		function NeighboursData(user:String) {
			super(user);
			
			_properties['neighbours'] = new Array();
			BASE_URL += "neighbours.xml";
		}
		
		override protected function parseData(evt:Event):void {
			super.parseData(evt);
			for each (var item:XML in _svcXML..user) {
				var user:Object = { 'name':item.@username,
								    'image':item.image,
								    'url':item.url,
									'match':Number(item.match) };
				_properties.neighbours.push(user);
			}

			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get neighbours():Array {
			return _properties['neighbours'];
		}
		
	}
	
}