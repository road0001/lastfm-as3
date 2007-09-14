package com.lfm.services.ArtistData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.ArtistData.AbstractArtistData;
	
	public class TopTracks extends AbstractArtistData {

		
		public function TopTracks(artist:String) {
			super(artist);
			_properties['tracks'] = new Array();
			BASE_URL += "toptracks.xml";
		}
		
		
		override protected function parseData(event:Event):void {
			super.parseData(event);
			
			for each (var item:XML in _svcXML..track) {
				var track:Object = { 'name':item.name,
								     'mbid':item.mbid,
								     'reach':Number(item.reach),
								     'url':item.url };
				_properties['tracks'].push(track);
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get artist():String {
			return _properties['artist'];
		}
		
		
		public function get tracks():Array {
			return _properties['tracks'];
		}
		
	}
	
}