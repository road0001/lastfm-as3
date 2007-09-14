package com.lfm.services.ArtistData {
	import com.lfm.services.AbstractService;
	import flash.events.Event;
	public class AbstractArtistData extends AbstractService {

		function AbstractArtistData(artist:String) {
			super();
			_properties['artist'] = artist;
			BASE_URL += "artist/" + artist + "/";
		}
		
		override protected function parseData(event:Event):void {
			super.parseData(event);
			_properties['artist'] = _svcXML.@artist.toString();
		}
	}
	
}