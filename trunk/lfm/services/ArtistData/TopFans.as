package com.lfm.services.ArtistData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.ArtistData.AbstractArtistData;
	
	public class TopFans extends AbstractArtistData {

		
		public function TopFans(artist:String) {
			super(artist);
			_properties['fans'] = new Array();
			BASE_URL += "fans.xml";
		}
		
		
		override protected function parseData(event:Event):void {
			super.parseData(event);
			
			for each (var item:XML in _svcXML..user) {
				var fan:Object = { 'username':item.@username,
								   'url':item.url,
								   'image':item.image,
								   'weight':Number(item.weight) };
				_properties['fans'].push(fan);
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get artist():String {
			return _properties['artist'];
		}
		
		
		public function get fans():Array {
			return _properties['fans'];
		}
		
	}
	
}