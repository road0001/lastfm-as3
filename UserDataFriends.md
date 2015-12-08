# Friends Summary #

Retrieves a Last.fm users list of friends. When the data is loaded, an array of friend objects can be referenced in the "friends" property of the class.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| friends (Array)           | Array of users that are friends on specified profile |


## Friend object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Friend username |
| url (String)   | URL to friends profile |
| image (String) | URL to friends avatar image |


## Example Usage ##

```
import com.lfm.services.UserData.Friends;
import flash.events.Event;

var friendsdata:Friends = new Friends("RJ");
friendsdata.addEventListener(Event.COMPLETE, serviceLoaded);
friendsdata.load();

function serviceLoaded(evt:Event):void {
    for(var i:Number = 0; i < friendsdata.friends.length; i++) {
        trace(i+". Friend Name:" + friendsdata.friends[i]['name']);
        trace(" Friends URL:" + friendsdata.friends[i]['url']);
        trace(" Friend Image:" + friendsdata.friends[i]['image']);
    }
}
```