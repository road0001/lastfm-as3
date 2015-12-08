**Package**      com.lfm.services.UserData

**Class**        public class RecentTracks

**Inheritance**  AbstractService --> AbstractUserData --> RecentTracks


# RecentTracks Summary #

Retrieves a Last.fm users list of recently played tracks. When the data is loaded, an array of track objects can be referenced in the "tracks" property of the class.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the neighbour data for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| tracks (Array)            | Array of users recently played tracks |


## Track object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Track name  |
| streamable (Boolean) | Track is streamable |
| artist (Object) | artist.name, artist.mbid (Musicbrainz ID) |
| url (String)   | URL of the track page |
| album (Object) | album.name, album.mbid (Musicbrainz ID) |
| date (Date)    | Date the track was scrobbled |


## Example Usage ##

```
import com.lfm.services.UserData.RecentTracks;
import flash.events.Event;

var recenttracksdata:RecentTracks = new RecentTracks("RJ");
recenttracksdata.addEventListener(Event.COMPLETE, serviceLoaded);
recenttracksdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < recenttracksdata.tracks.length; i++) {
        trace(i+". Track Name:" + recenttracksdata.tracks[i].name);
        trace(" Track URL:" + recenttracksdata.tracks[i].url);
        trace(" Track Streamable:" + recenttracksdata.tracks[i].streamable);
        trace(" Track Artist:" + recenttracksdata.tracks[i].artist);
        trace(" Track Album Name:" + recenttracksdata.tracks[i].album.name);
        trace(" Track Album MBID:" + recenttracksdata.tracks[i].album.mbid);
        trace(" Track Date:" + recenttracksdata.tracks[i].date);
    }
}
```