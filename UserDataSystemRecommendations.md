**Package**      com.lfm.services.UserData

**Class**        public class SystemRecommendations

**Inheritance**  AbstractService --> AbstractUserData --> SystemRecommendations


# SystemRecommendations Summary #

Retrieves system recommended events for a Last.fm user. When the data is loaded, an array of recommendation objects can be referenced in the "recommendations" property of the class.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the data for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| link (String)             | URL to the users profile. |
| description (String)      | Description of the recommendation feed |
| recommendations (Array)   | Array of users system recommendations |


## Recommendation object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Name of the recommendation |
| url (String)   | URL to the recommended item |
| mbid (String)  | Musicbrainz ID of the recommended item |


## Example Usage ##

```
import com.lfm.services.UserData.SystemRecommendations;
import flash.events.Event;

var recdata:SystemRecommendations = new SystemRecommendations("RJ");
recdata.addEventListener(Event.COMPLETE, serviceLoaded);
recdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < recdata.recommendations.length; i++) {
        trace(i+". Recommendation Name: " + recdata.recommendations[i]['name']);
        trace(" Recommendation URL:" + recdata.recommendations[i]['url']);
        trace(" Recommendation MBID:" + recdata.recommendations[i]['mbid']);
    }
}
```








