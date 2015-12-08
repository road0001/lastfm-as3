**Package**      com.lfm.services.UserData

**Class**        public class TasteOMeter

**Inheritance**  AbstractService --> AbstractUserData --> TasteOMeter


# TasteOMeter Summary #

Retrieves Taste-O-Meter scores for two users.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the data for. |
| Username (to compare to)  | (required) Last.fm username to compare taste with. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| compareWith (String)      | Username to compare taste with. |
| commonArtists (Array)     | Array of artists the 2 users have in common |
| score (Number)            | Number rating of musical compatibility |


## Example Usage ##

```
import com.lfm.services.UserData.TasteOMeter;
import flash.events.Event;

var tastedata:TasteOMeter = new TasteOMeter("RJ", "TheMariner");
tastedata.addEventListener(Event.COMPLETE, serviceLoaded);
tastedata.load();

function serviceLoaded(event:Event):void {
    trace("Score: "+tastedata.score);
    trace("Common artists: "+tastedata.commonArtists.join(", "));
}
```






