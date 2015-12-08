**Package**      com.lfm.services.UserData

**Class**        public class TopAlbums

**Inheritance**  AbstractService --> AbstractUserData --> TopAlbums


# TopAlbums Summary #

Retrieves the 50 most played albums from a Last.fm music profile.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| Type                      | (optional) accepts "3month", "6month", or "12month" for different chart results. Default is "overall" |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| complete                  | Dispatched when the data has been loaded (Event.COMPLETE) |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| albums (Array)            | Array of top albums |
| type (String)             | Chart type returned (overall, 3month, 6month, 12month) |

## Album object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| artist (Object) | Name and Musicbrainz ID of the artist (artist.name, artist.mbid) |
| name (String)  | Album name  |
| mbid (String)  | Musicbrainz.org ID of the album |
| rank (Number)  | Album rank on the users chart |
| playcount (Number) | Number of times user has played this artist |
| url (String)   | URL to the artists Last.fm profile page |
| image (Object) | URL to the small, medium and large album image covers (image.small, image.medium, image.large) |


## Example Usage ##

```
import com.lfm.services.UserData.TopAlbums;
import flash.events.Event;

var albumdata:TopAlbums = new TopAlbums("RJ");
albumdata.addEventListener(Event.COMPLETE,serviceLoaded);
albumdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < albumdata.albums.length; i++) {
        trace(i+". Album Name:" + albumdata.albums[i]['name']);
        trace(" Album Artist:" + albumdata.albums[i]['artist']['name']);
        trace(" Album Artist Musicbrainz ID:" + albumdata.albums[i]['artist']['mbid']);
        trace(" Musicbrainz ID:" + albumdata.albums[i]['mbid']);
        trace(" Rank:" + albumdata.albums[i]['rank']);
        trace(" Playcount:" + albumdata.albums[i]['playcount']);
        trace(" URL:" + albumdata.albums[i]['url']);
        trace(" Image Large:" + albumdata.albums[i]['image']['large']);
        trace(" Image Medium:" + albumdata.albums[i]['image']['medium']);
        trace(" Image Small:" + albumdata.albums[i]['image']['small']);
    }
}
```
