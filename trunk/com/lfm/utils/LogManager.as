package com.lfm.utils
{
	import flash.filesystem.*;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.collections.ArrayCollection;
	import flash.events.ErrorEvent;
	import com.lfm.core.model.Track;

	[Bindable]
	public class LogManager extends EventDispatcher 
	{
		
		public var _entries:ArrayCollection;
		private var _client:String;
		private var _timezone:String;
		private var _version:String;
		private var _logFile:File;
		
		public function load(file:File):void {
			_logFile = file;
			var stream:FileStream = new FileStream();
			stream.openAsync( file, FileMode.READ );
			stream.addEventListener( Event.COMPLETE, readComplete );
		}
		
		private function readComplete(event:Event):void {
			try {
				// Get the stream reference back from the event object
			    var stream:FileStream = event.target as FileStream;
			    // Read the entire contents of the file as a string
			    var contents:String = stream.readUTFBytes( stream.bytesAvailable )
			    // Clean up - free resources that are in use
			    stream.close();
			    
			    parseLog(contents);
			}
			catch(err:Error) {
				var errEvt:ErrorEvent = new ErrorEvent(ErrorEvent.ERROR);
				errEvt.text = "Error opening log file. Make Sure it's in the proper format.";
				dispatchEvent( errEvt );
			}
		}
		
		private function parseLog(contents:String):void {
			
			var lines:Array = contents.split("\n");
			var tempArr:Array = new Array();
			
			try {
				_version = lines[0].split("/")[1];
				_timezone = lines[1].split("/")[1];
				_client = lines[2].split("/")[1];
				_entries = new ArrayCollection();
				
				for(var i:int = 3; i < lines.length-1; i++) {
					var line:Array = lines[i].split("\t");
					var entry:Object = new Object();
					
					entry['artist'] = line[0];
					entry['album'] = line[1];
					entry['track'] = line[2];
					entry['tracknum'] = line[3];
					entry['length'] = line[4];
					if(line[5] == "S") {
						entry['skipped'] = false;
						entry['submit'] = false;
					} else {
						entry['skipped'] = true;
						entry['submit'] = true;
					}
					entry['rating'] = line[6];
					tempArr.push(entry);
				}
				//tempArr = tempArr.reverse();
				_entries.source = tempArr;
				dispatchEvent( new Event("complete") )
			}
			catch(error:Error) {
				var errEvt:ErrorEvent = new ErrorEvent(ErrorEvent.ERROR);
				errEvt.text = "Error parsing log file. Make Sure it's in the proper format.";
				dispatchEvent( errEvt );
			}
		}
		
		
		public function removeEntry(idx:int):void {
			_entries.removeItemAt(idx);
			
		}
		
		public function save():void {
			var contents:String = "";
			contents = contents.concat("#AUDIOSCROBBLER/",_version,"\n");
			contents = contents.concat("#TZ/",_timezone,"\n");
			contents = contents.concat("#CLIENT/",_client,"\n");
			for(var i:int = 0; i < _entries.length; i++) {
				var entry:Object = _entries.getItemAt(i);
				if(!entry['submit']) entry['skipped'] = "S";
				else entry['skipped'] = "L";
				contents = contents.concat(entry['artist'],"\t",
					entry['album'],"\t",
					entry['track'],"\t",
					entry['tracknum'],"\t",
					entry['length'],"\t",
					entry['skipped'],"\t",
					entry['rating'],"\t","\n");
					
			}
			var stream:FileStream = new FileStream();
			stream.open(_logFile, FileMode.WRITE );
			stream.writeUTFBytes(contents);
			stream.close();
			
		}
		
		public function calculateTimeless():void {
			var endTime:int = Track.dateToTimestamp(new Date());
			var subTime:Number = 0;
			for(var i:int = _entries.length-1; i >= 0; i--) {
				if(_entries.source[i]['submit']) {
					subTime = (subTime + Number(_entries.source[i]['length']));
					trace("subtime: "+subTime);
					_entries.source[i]['timestamp'] = (endTime-subTime);
				}
			}
		}
		
		public function get entries():Array {
			return _entries.source;
		}
		
		public function get timezone():String {
			return _timezone;
		}
		
		public function get client():String {
			return _client;
		}
		
		public function get version():String {
			return _version;
		}
		
		
		
	}
}