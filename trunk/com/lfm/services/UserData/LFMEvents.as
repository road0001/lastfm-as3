package com.lfm.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.UserData.AbstractEventsData;
	
	public class LFMEvents extends AbstractEventsData {
		
		public function EventsData(user:String,type="personal") {
			super(user);
			if(type == "recommended") {
				BASE_URL += "eventsysrecs.rss";
			} else if(type == "friends") {
				BASE_URL += "friendevents.rss";
			} else {
				BASE_URL += "events.rss";
			}
		}
		
	}
	
}