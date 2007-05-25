package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class RecentLovedTracksData extends AbstractUserData {
		

		function RecentLovedTracksData(user:String) {
			super(user);
			
			_properties['tracks'] = new Array();
			BASE_URL += "recentlovedtracks.xml";
		}
		
		
		override protected function parseData(evt:Event):void {
	
			super.parseData(evt);
			for each (var item:XML in _svcXML..track) {
				var track:Object = {'artist':{name:item.artist, mbid:item.artist.@mbid},
									'name':item.name,
								    'mbid':item.mbid,
								    'url':item.url,
									'date':new Date(Number(item.date.@uts)*1000) };
				_properties.tracks.push(track);
			}

			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get tracks():Array {
			return _properties['tracks'];
		}
		
	}
	
}