package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class TopTrackTagsData extends AbstractUserData {

		
		function TopTrackTagsData(user:String,artist:String,track:String) {
			super(user);
			_properties['artist'] = artist;
			_properties['track'] = track;
			_properties['tags'] = new Array();
			BASE_URL += "tracktags.xml?artist="+artist+"&track="+track;
		}
		
		
		override protected function parseData(evt:Event):void {
			
			super.parseData(evt);
			_properties['track'] = _svcXML.@track.toString();
			_properties['artist'] = _svcXML.@artist.toString();
			
			for each (var item:XML in _svcXML..tag) {
				var tag:Object = { 'name':item.name,
								   'count':Number(item.count),
								   'url':item.url };
				_properties.tags.push(tag);
			}

			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get artist():String {
			return _properties['artist'];
		}
		
		public function get track():String {
			return _properties['track'];
		}
		
		public function get tags():Array {
			return _properties['tags'];
		}
		
	}
	
}