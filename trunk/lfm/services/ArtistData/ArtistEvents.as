package com.lfm.services.ArtistData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.AbstractEventsData;
	
	public class ArtistEvents extends AbstractEventsData {
		
		public function ArtistEvents(artist:String) {
			super();
			BASE_URL += "artist/" + artist + "/events.rss";
		}
		
	}
	
}