package com.lfm.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.AbstractEventsData;
	
	public class RecommendedEvents extends AbstractEventsData {
		
		public function RecommendedEvents(user:String) {
			super(user);
			BASE_URL += "eventsysrecs.rss";
		}
		
	}
	
}