package com.lfm.core.services.UserData {
	import com.lfm.core.services.AbstractService;
	import flash.events.Event;
	public class AbstractUserData extends AbstractService {
		
		
		
		function AbstractUserData(user:String) {
			super();
			_properties['username'] = user;
			BASE_URL += "user/" + user + "/";
		}
		
		
		override protected function parseData(evt:Event):void {
			super.parseData(evt);
			_properties['username'] = _svcXML.@user.toString();
		}
		
	}
	
}