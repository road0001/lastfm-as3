**Package**      com.lfm.services.UserData

**Class**        public class TopTrackTags

**Inheritance**  AbstractService --> AbstractUserData --> TopTrackTags


# TopTrackTags Summary #

Retrieves a Last.fm users top tags for a track. When the data is loaded, an array of tag objects can be referenced in the "tags" property of the class.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| Artist                    | (required) Track artist. |
| Track                     | (required) Track name to lookup tags for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| complete                  | Dispatched when the data has been loaded (Event.COMPLETE) |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| track (String)            | Track being referenced for tags. |
| tags (Array)              | Array of users tags for the track. |

## Tag object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Name of the tag |
| count (Number) | Number of times tag occurs |
| url (String)   | URL to the specific tag page on Last.fm |


## Example Usage ##

```
import com.lfm.services.UserData.TopAlbumTags;
import flash.events.Event;

var tagdata:TopAlbumTags = new TopAlbumTags("RJ","Metallica","Ride the Lightning");
tagdata.addEventListener(Event.COMPLETE, serviceLoaded);
tagdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < tagdata.tags.length; i++) {
        trace(i+". Tag Name:" + tagdata.tags[i]['name']);
        trace(" Tag Count:" + tagdata.tags[i]['count']);
        trace(" Tag URL:" + tagdata.tags[i]['url']);
    }
}
```
