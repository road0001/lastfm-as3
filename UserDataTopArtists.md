**Package**      com.lfm.services.UserData

**Class**        public class TopArtists

**Inheritance**  AbstractService --> AbstractUserData --> TopArtists


# TopArtists Summary #

Retrieves the 50 most played artists from a Last.fm music profile.


## Details ##

| **Arguments** | **Summary** |
|:--------------|:------------|
| Username      | (required) Last.fm username to retrieve the profile data for. |
| Type          | (optional) accepts "3month", "6month", or "12month" for different chart results. Default is "overall" |
| **Functions** | **Summary** |
| load          | Fetches data from web service |
| **Events**    | **Summary** |
| complete      | Dispatched when the data has been loaded (Event.COMPLETE) |
| ioError       | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| username (String) | Username for the profile being queried |
| artists (Array) | Array of top artists |
| type (String) | Chart type returned (overall, 3month, 6month, 12month) |

## Artist object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Name of the artist |
| mbid (String)  | Musicbrainz.org ID |
| rank (Number)  | Artist rank on the users chart |
| playcount (Number) | Number of times user has played this artist |
| url (String)   | URL to the artists Last.fm profile page |
| thumbnail (String) | URL to the artists image as a thumbnail |
| image (String) | URL to the artists larger image |

## Example Usage ##

```
import com.lfm.services.UserData.TopArtists;
import flash.events.Event;

var artistdata:TopArtists = new TopArtists("RJ");
artistdata.addEventListener("complete",serviceLoaded);
artistdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < artistdata.artists.length; i++) {
        trace(i+". Artist Name:" + artistdata.artists[i]['name']);
        trace(" Musicbrainz ID:" + artistdata.artists[i]['mbid']);
        trace(" Rank:" + artistdata.artists[i]['rank']);
        trace(" Playcount:" + artistdata.artists[i]['playcount']);
        trace(" URL:" + artistdata.artists[i]['url']);
        trace(" Thumbnail:" + artistdata.artists[i]['thumbnail']);
        trace(" Image:" + artistdata.artists[i]['image']);
    }
}
```