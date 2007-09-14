package com.lfm.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.services.AbstractEventsData;
	
	public class LFMEvents extends AbstractEventsData {
		
		public function LFMEvents(user:String,type="personal") {
			super();
			if(type == "recommended") {
				BASE_URL += "user/" + user + "/eventsysrecs.rss";
			} else if(type == "friends") {
				BASE_URL += "user/" + user + "/friendevents.rss";
			} else {
				BASE_URL += "user/" + user + "/events.rss";
			}
		}
		
	}
	
}