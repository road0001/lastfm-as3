package com.lfm.services.ArtistData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.ArtistData.AbstractArtistData;
	
	public class RelatedArtists extends AbstractArtistData {

		
		public function RelatedArtists(artist:String) {
			super(artist);
			_properties['relatedArtists'] = new Array();
			BASE_URL += "similar.xml";
		}
		
		
		override protected function parseData(event:Event):void {
			super.parseData(event);
			
			for each (var item:XML in _svcXML..artist) {
				var artist:Object = { 'name':item.name,
									  'mbid':item.mbid,
									  'match':Number(item.match),
									  'url':item.url,
									  'image':{small:item.image_small, large:item.image},
									  'streamable': Boolean(item.streamable) };
				_properties['relatedArtists'].push(artist);
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get artist():String {
			return _properties['artist'];
		}
		
		
		public function get relatedArtists():Array {
			return _properties['relatedArtists'];
		}
		
	}
	
}