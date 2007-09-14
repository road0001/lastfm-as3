package com.lfm.services.ArtistData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.ArtistData.AbstractArtistData;
	
	public class TopAlbums extends AbstractArtistData {

		
		public function TopAlbums(artist:String) {
			super(artist);
			_properties['albums'] = new Array();
			BASE_URL += "topalbums.xml";
		}
		
		
		override protected function parseData(event:Event):void {
			super.parseData(event);
			
			for each (var item:XML in _svcXML..album) {
				var album:Object = { 'name':item.name,
								     'mbid':item.mbid,
								     'reach':Number(item.reach),
								     'url':item.url,
									 'image': {small: item.image.small,
									 		   medium: item.image.medium,
											   large: item.image.large} };
				_properties['albums'].push(album);
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get artist():String {
			return _properties['artist'];
		}
		
		
		public function get albums():Array {
			return _properties['albums'];
		}
		
	}
	
}