
package com.lfm.core.view.widgets {	
	
	import com.lfm.core.services.UserData.LFMEvents;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class EventsWidget extends Sprite {
		
		private var _target:MovieClip;
		private var _calendar:LFMEvents;
		private var _user:String;
		private var _style:String;
		
		private var _month_abbr:Object =  {'January':"JAN",
						  'February':"FEB",
						  'March':"MAR",
						  'April':"APR",
						  'May':"MAY",
						  'June':"JUN",
						  'July':"JUL",
						  'August':"AUG",
						  'September':"SEP",
						  'October':"OCT",
						  'November':"NOV",
						  'December':"DEC" };
		private var _month_index:Array = ['January',
										  'February',
										  'March',
										  'April',
										  'May',
										  'June',
										  'July',
										  'August',
										  'September',
										  'October',
										  'November',
										  'December'];
		
		public function EventsWidget(username:String,style:String="black") {
			_calendar = new LFMEvents(username);
			_calendar.addEventListener("complete",eventsLoaded);
			this.user = username;
			_style = style;
			this.load();
		}
		
		private function load():void {
			_calendar.load();
		}
		
		private function eventsLoaded(event:Event):void {
			trace("EventsWidget: events loaded");
			trace("EventsWidget: # of events: "+event.target.events.length);
			
			var calEvents:Array =  event.target.events;
			for(var i:Number = 0; i < calEvents.length; i++) {
				var item:EventItem = new EventItem(_style);
				item.lineup = calEvents[i].artists.join(", ");
				item.location = calEvents[i].venue;
				item.dateHead = _month_abbr[_month_index[calEvents[i].start.getUTCMonth()]];
				item.dateBody = calEvents[i].start.getUTCDate();
				item.y = i*44;
				addChild(item);
			}
		}
		
		
		public function set user(username:String):void {
			_user = username;
		}
		
	}
	
	




}