**Package**      com.lfm.services.UserData

**Class**        public class UserEvents

**Inheritance**  AbstractService --> AbstractEventsData --> UserEvents


# UserEvents Summary #

Retrieves upcoming events for a user, a users friends, or recommended by Last.fm. A second constructor argument is available. It defaults to "personal" meaning it get the specified users upcoming events. "recommended" will get events recommended to the user and "friends" will get the events being attended by the users friends.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the data for. |
| Type                      | (optional) "personal" (default), "recommended", or "friends" |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| location (String)         | URL to the users events page. |
| description (String)      | Description of the events feed |
| events (Array)            | Array of events |


## Event object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Event name  |
| artists (Array) | Array of artists playing at the event. |
| description (String) | Description of the event |
| link (String)  | URL to the event page on Last.fm |
| venue (String) | Name of the venue where the event is to take place |
| venueLink (String) | URL to the event's venue page on Last.fm |
| address (String) | Address of the event |
| start (Date)   | Start date of the event |
| end (Date)     | End date of the event |


## Example Usage ##

```
import com.lfm.services.UserData.UserEvents;
import flash.events.Event;

var eventdata:UserEvents = new UserEvents("RJ");
eventdata.addEventListener(Event.COMPLETE, serviceLoaded);
eventdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < eventdata.events.length; i++) {
        trace(i+". Event Name: " + eventdata.events[i]['name']);
        trace(" Event artists: " + eventdata.events[i]['artists'].join(", "));
        trace(" Event Description: " + eventdata.events[i]['description']);
        trace(" Event link: " + eventdata.events[i]['link']);
        trace(" Event venue: " + eventdata.events[i]['venue']);
    }
}
```

