**Package**      com.lfm.services.UserData

**Class**        public class WeeklyChartList

**Inheritance**  AbstractService --> AbstractUserData --> WeeklyChartList


# WeeklyChartList Summary #

Retrieves all available weekly charts available for a user. The list is a list of time spans in unix timestamp format. You could then use this "from" and "to" time spans with [Weekly Albums Chart](UserDataWeeklyAlbumsChart.md), [Weekly Artist Charts](UserDataWeeklyArtistsChart.md), and [Weekly Tracks Chart](UserDataWeeklyTracksChart.md) to get detailed chart data for specified time spans.


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
| charts (Array)            | Array of available charts |


## Chart object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| from (Number)  | Start date of the weekly chart (unix timestamp format) |
| to (Nubmer)    | End date of the weekly chart (unix timestamp format) |


## Example Usage ##

```
import com.lfm.services.UserData.WeeklyChartList;
import flash.events.Event;

var chartdata:WeeklyChartList = new WeeklyChartList("RJ");
chartdata.addEventListener(Event.COMPLETE, serviceLoaded);
chartdata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < chartdata.charts.length; i++) {
        trace(i+". Chart from: " + chartdata.charts[i]['from']);
        trace(" Chart to:" + chartdata.charts[i]['to']);
    }
}
```