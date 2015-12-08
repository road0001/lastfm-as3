**Package**      com.lfm.services.UserData

**Class**        public class WeeklyAlbumsChart

**Inheritance**  AbstractService --> AbstractUserData --> WeeklyAlbumsChart


# WeeklyAlbumsChart Summary #

Retrieves most recent or specified date range of a users album charts. Passing only a username will return the most recent chart. Passing a "from" and "to" timestamp range will return the chart for that time span. Available date ranges can be retrieved using the [WeeklyChartList](UserDataWeeklyChartList.md) class


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
| albums (Array)            | Array of albums in the chart |


## Album object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| artist (Object) | Artist name (artist.name) and Musicbrainz ID (artist.mbid) |
| name (String)  | Album name  |
| mbid (String)  | Albums Musicbrainz ID |
| chartposition (Number) | Rank on the chart |
| playcount (Number) | Playcount for the week |
| url (String)   | URL for the album page |


## Example Usage ##

```
import com.lfm.services.UserData.WeeklyAlbumsChart;
import flash.events.Event;

var chartdata:WeeklyAlbumsChart = new WeeklyAlbumsChart("RJ");
chartdata.addEventListener(Event.COMPLETE, serviceLoaded);
chartdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < chartdata.albums.length; i++) {
        trace(i+". Album name: " + chartdata.albums[i]['name']);
        trace(" Album artist: " + chartdata.albums[i]['artist']['name']);
        trace(" Album artist MBID: " + chartdata.albums[i]['artist']['mbid']);
        trace(" Album MBID:" + chartdata.albums[i]['mbid']);
        trace(" Chart position:" + chartdata.albums[i]['chartposition']);
        trace(" Plays:" + chartdata.albums[i]['playcount']);
        trace(" Album URL:" + chartdata.albums[i]['url']);
    }
}
```
