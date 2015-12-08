**Package**      com.lfm.services.UserData

**Class**        public class RecentLovedTracks

**Inheritance**  AbstractService --> AbstractUserData --> RecentLovedTracks


# RecentLovedTracks Summary #

Retrieves a Last.fm users list of recently loved tracks. When the data is loaded, an array of track objects can be referenced in the "tracks" property of the class.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the data for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| tracks (Array)            | Array of users recently loved tracks |


## Track object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Track name  |
| artist (Object) | artist.name, artist.mbid (Musicbrainz ID) |
| url (String)   | URL of the track page |
| mbid (String)  | Musicbrainz ID of the track |
| date (Date)    | Date the track was loved |


## Example Usage ##

```
import com.lfm.services.UserData.RecentLovedTracks;
import flash.events.Event;

var recenttracksdata:RecentLovedTracks = new RecentLovedTracks("RJ");
recenttracksdata.addEventListener(Event.COMPLETE, serviceLoaded);
recenttracksdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < recenttracksdata.tracks.length; i++) {
        trace(i+". Track Name:" + recenttracksdata.tracks[i].name);
        trace(" Track URL:" + recenttracksdata.tracks[i].url);
        trace(" Track Artist:" + recenttracksdata.tracks[i].artist.name);;
        trace(" Track Artist MBID:" + recenttracksdata.tracks[i].artist.mbid);
        trace(" Track Loved Date:" + recenttracksdata.tracks[i].date);
    }
}
```
