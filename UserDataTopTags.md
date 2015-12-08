**Package**      com.lfm.services.UserData

**Class**        public class TopTags

**Inheritance**  AbstractService --> AbstractUserData --> TopTags


# TopTags Summary #

Retrieves a Last.fm users top tags. When the data is loaded, an array of tag objects can be referenced in the "tags" property of the class.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| complete                  | Dispatched when the data has been loaded (Event.COMPLETE) |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| tags (Array)              | Array of users top tags. |

## Tag object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Name of the tag |
| count (Number) | Number of times tag occurs |
| url (String)   | URL to the specific tag page on Last.fm |


## Example Usage ##

```
import com.lfm.services.UserData.TopTags;
import flash.events.Event;

var tagdata:TopTags = new TopTags("RJ");
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