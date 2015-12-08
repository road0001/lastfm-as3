**Package**      com.lfm.services.UserData

**Class**        public class WeeklyArtistsChart

**Inheritance**  AbstractService --> AbstractUserData --> WeeklyArtistsChart


# WeeklyArtistsChart Summary #

Retrieves most recent or specified date range of a users artist charts. Passing only a username will return the most recent chart. Passing a "from" and "to" timestamp range will return the chart for that time span. Available date ranges can be retrieved using the [WeeklyChartList](UserDataWeeklyChartList.md) class


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the data for. |
| From                      | (optional) Start date in unix timestamp format. |
| To                        | (optional) End date in unix timestamp format. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| complete                  | Dispatched when the data has been loaded. (Event.COMPLETE) |
| **Properties** (read-only) | **Summary** |
| username (String)         | Username for the profile being queried |
| from (Number)             | Start date in unix timestamp format. |
| to (Number)               | End date in unix timestamp format. |
| artists (Array)           | Array of artists in the chart |


## Artist object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| name (String)  | Artist name |
| mbid (String)  | Artists Musicbrainz ID |
| chartposition (Number) | Rank on the chart |
| playcount (Number) | Playcount for the week |
| url (String)   | URL for the artist page |


## Example Usage ##

```
import com.lfm.services.UserData.WeeklyArtistsChart;
import flash.events.Event;

var chartdata:WeeklyArtistsChart = new WeeklyArtistsChart("RJ");
chartdata.addEventListener(Event.COMPLETE, serviceLoaded);
chartdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < chartdata.artists.length; i++) {
        trace(i+". Artist name: " + chartdata.artists[i]['name']);
        trace(" Artist MBID:" + chartdata.artists[i]['mbid']);
        trace(" Chart position:" + chartdata.artists[i]['chartposition']);
        trace(" Plays:" + chartdata.artists[i]['playcount']);
        trace(" Artist URL:" + chartdata.artists[i]['url']);
    }
}
```
