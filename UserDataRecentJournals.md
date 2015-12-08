**Package**      com.lfm.services.UserData

**Class**        public class RecentJournals

**Inheritance**  AbstractService --> AbstractUserData --> RecentJournals


# RecentJournals Summary #

Retrieves a Last.fm users recently journal entries. When the data is loaded, an array of journal objects can be referenced in the "journals" property of the class.


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
| location (String)         | URL to the users journal page |
| description (String)      | Description of the journal feed |
| journals (Array)          | Array of users recent journals |


## Journal object structure ##

| **Properties** | **Summary** |
|:---------------|:------------|
| title (String) | Title of the journal |
| link (String)  | URL to the specific journal |
| pubDate (Date) | Date the journal was published |
| content (String) | Content of the journal |


## Example Usage ##

```
import com.lfm.services.UserData.RecentJournals;
import flash.events.Event;

var recentjournaldata:RecentJournals = new RecentJournals("RJ");
recentjournaldata.addEventListener(Event.COMPLETE, serviceLoaded);
recentjournaldata.load();

function serviceLoaded(event:Event):void {
    for(var i:Number = 0; i < recentjournaldata.journals.length; i++) {
        trace(i+". Journal Title: " + recentjournaldata.journals[i]['title']);
        trace(" Journal URL:" + recentjournaldata.journals[i]['link']);
        trace(" Journal Publish Date:" + recentjournaldata.journals[i]['pubDate']);;
        trace(" Journal Content:" + recentjournaldata.journals[i]['content']);
    }
}
```