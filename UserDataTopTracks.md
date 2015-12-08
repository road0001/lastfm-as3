**Package**      com.lfm.services.UserData

**Class**        public class TopTracks

**Inheritance**  AbstractService --> AbstractUserData --> TopTracks


# TopTracks Summary #

Retrieves the 50 most played tracks from a Last.fm music profile.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| Type                      | (optional) accepts "3month", "6month", or "12month" for different chart results. Default is "overall" |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| username                  | Username for the profile being queried |
| tracks (Array)            | Array of most played tracks |
| type (String)             | Chart type returned (overall, 3month, 6month, 12month) |

## Track object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| artist (Object) | Name and Musicbrainz ID of the artist (artist.name, artist.mbid) |
| name (String)  | Track name  |
| mbid (String)  | Musicbrainz.org ID of the track |
| rank (Number)  | Album rank on the users chart |
| playcount (Number) | Number of times user has played this artist |
| url (String)   | URL to the artists Last.fm profile page |


## Example Usage ##

```
import com.lfm.services.UserData.TopTracks;
import flash.events.Event;

var trackdata:TopTracks = new TopTracks("RJ");
trackdata.addEventListener(Event.COMPLETE,serviceLoaded);
trackdata.load();

function serviceLoaded(evt:Event):void {
    for(var i:Number = 0; i < trackdata.tracks.length; i++) {
        trace(i+". Album Name:" + trackdata.tracks[i]['name']);
        trace(" Track Artist:" + trackdata.tracks[i]['artist']['name']);
        trace(" Track Artist Musicbrainz ID:" + trackdata.tracks[i]['artist']['mbid']);
        trace(" Musicbrainz ID:" + trackdata.tracks[i]['mbid']);
        trace(" Rank:" + trackdata.tracks[i]['rank']);
        trace(" Playcount:" + trackdata.tracks[i]['playcount']);
        trace(" URL:" + trackdata.tracks[i]['url']);
    }
}
```