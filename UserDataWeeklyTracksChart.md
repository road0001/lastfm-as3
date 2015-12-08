**Package**      com.lfm.services.UserData

**Class**        public class WeeklyTracksChart

**Inheritance**  AbstractService --> AbstractUserData --> WeeklyTracksChart


# WeeklyAlbumsChart Summary #

Retrieves most recent or specified date range of a users track chart. Passing only a username will return the most recent chart. Passing a "from" and "to" timestamp range will return the chart for that time span. Available date ranges can be retrieved using the [WeeklyChartList](UserDataWeeklyChartList.md) class


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
| tracks (Array)            | Array of tracks in the chart |


## Track object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| artist (Object) | Artist name (artist.name) and Musicbrainz ID (artist.mbid) |
| name (String)  | Track name  |
| mbid (String)  | Track Musicbrainz ID |
| chartposition (Number) | Rank on the chart |
| playcount (Number) | Playcount for the week |
| url (String)   | URL for the album page |


## Example Usage ##

```
import com.lfm.services.UserData.WeeklyTracksChart;
import flash.events.Event;

var chartdata:WeeklyTracksChart = new WeeklyTracksChart("RJ");
chartdata.addEventListener(Event.COMPLETE, serviceLoaded);
chartdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < chartdata.tracks.length; i++) {
        trace(i+". Track name: " + chartdata.tracks[i]['name']);
        trace(" Track artist: " + chartdata.tracks[i]['artist']['name']);
        trace(" Track artist MBID: " + chartdata.tracks[i]['artist']['mbid']);
        trace(" Track MBID:" + chartdata.tracks[i]['mbid']);
        trace(" Track position:" + chartdata.tracks[i]['chartposition']);
        trace(" Plays:" + chartdata.tracks[i]['playcount']);
        trace(" Track URL:" + chartdata.tracks[i]['url']);
    }
}
```

