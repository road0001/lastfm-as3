package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class RecentTracksData extends AbstractUserData {
		
		function RecentTracksData(user:String) {
			super(user);
			
			_properties['tracks'] = new Array();
			BASE_URL += "recenttracks.xml";
		}
		
		
		override protected function parseData(evt:Event):void {
			
			super.parseData(evt);
			for each (var item:XML in _svcXML..track) {
				var track:Object = {'streamable':Boolean(item.@streamable),
									'artist':{name:item.artist, mbid:item.artist.@mbid},
									'name':item.name,
								    'mbid':item.mbid,
								    'url':item.url,
									'album':{name:item.album, mbid:item.album.@mbid},
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