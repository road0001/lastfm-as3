﻿package com.lfm.core.services.UserData {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.lfm.core.services.UserData.AbstractUserData;
	
	public class TopArtistsData extends AbstractUserData {

		
		function TopArtistsData(user:String,type:String="overall") {
			super(user);

			_properties['type'] = type;
			_properties['artists'] = new Array();
			BASE_URL += "topartists.xml?type="+type;
		}
		
		
		override protected function parseData(evt:Event):void {
			super.parseData(evt);
			_properties['type'] = _svcXML.@type.toString();
			
			for each (var item:XML in _svcXML..artist) {
				var artist:Object = { 'name':item.name,
									  'mbid':item.mbid,
									  'rank':Number(item.rank),
									  'playcount':Number(item.playcount),
									  'url':item.url,
									  'thumbnail':item.thumbnail,
									  'image':item.image };
				_properties.artists.push(artist);
			}
			
			dispatchEvent(new Event("complete"));
		}
		
		public function get username():String {
			return _properties['username'];
		}
		
		public function get type():String {
			return _properties['type'];
		}
		
		public function get artists():Array {
			return _properties['artists'];
		}
		
	}
	
}