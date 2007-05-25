package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class WeeklyChartListData extends AbstractUserData {

		
		function WeeklyChartListData(user:String) {
			super(user);
			_properties['charts'] = new Array();
			BASE_URL += "weeklychartlist.xml";
		}
		
		
		override protected function parseData(evt:Event):void {
			
			super.parseData(evt);
			for each (var item:XML in _svcXML..chart) {
				var chart:Object = {'from':Number(item.@from),
									'to':Number(item.@to) };
				_properties.charts.push(chart);
				
			}
			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get charts():Array {
			return _properties['charts'];
		}
		
	}
	
}