**Package**      com.lfm.services.UserData

**Class**        public class Neighbours

**Inheritance**  AbstractService --> AbstractUserData --> Neighbours


# Neighbours Summary #

Retrieves a Last.fm users list of neighbours. When the data is loaded, an array of neighbour objects can be referenced in the "neighbours" property of the class.


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
| neighbours (Array)        | Array of users that are neighbours on the specified profile |


## Neighbour object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Neighbour username |
| url (String)   | URL to neighbours profile |
| image (String) | URL to neighbours avatar image |
| match (Number) |             |

## Example Usage ##

```
import com.lfm.services.UserData.Neighbours;
import flash.events.Event;

var neighboursdata:Neighbours = new Neighbours("RJ");
neighboursdata.addEventListener(Event.COMPLETE, serviceLoaded);
neighboursdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < neighboursdata.friends.length; i++) {
        trace(i+". Neighbour Name:" + neighboursdata['neighbours'][i]['name']);
        trace(" Neighbour URL:" + neighboursdata['neighbours'][i]['url']);
        trace(" Neighbour Image:" + neighboursdata['neighbours'][i]['image']);
        trace(" Neighbour Match:" + neighboursdata['neighbours'][i]['match']);
    }
}
```