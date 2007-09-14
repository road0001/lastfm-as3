package com.lfm.services.ArtistData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.ArtistData.AbstractArtistData;
	
	public class TopTags extends AbstractArtistData {

		
		public function TopTags(artist:String) {
			super(artist);
			_properties['tags'] = new Array();
			BASE_URL += "toptags.xml";
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
		
		public function get artist():String {
			return _properties['artist'];
		}
		
		
		public function get tags():Array {
			return _properties['tags'];
		}
		
	}
	
}