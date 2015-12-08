**Package**      com.lfm.services.UserData

**Class**        public class Profile

**Inheritance**  AbstractService --> AbstractUserData --> Profile


# Profile Summary #

Retrieves the data from the Last.fm Profile Information web services for a specific user.


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| **Methods**               | **Summary** |
| load                      | Fetches data from web service |
| **Events**                | **Summary** |
| complete                  | Dispatched when the data has been loaded (Event.COMPLETE) |
| ioError                   | Dispatched when there is a problem connecting to the web service (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| id (Number)               | ID of user profile |
| cluster (String)          | Cluster of user profile on Last.fm |
| username (String)         | Username for the profile being queried |
| url (String)              | URL to the Last.fm profile |
| mboxsha1sum (String)      |             |
| registered (Date)         | Actionscript UTC date object of the users Last.fm registration date |
| playcount (Number)        | Number of tracks user has played since registration |
| age (Number)              | Age of the user (not always available) |
| gender (String)           | Gender of user, "m" or "f" (not always available) |
| country (String)          | Country of user (not always available) |
| avatar (String)           | URL to the users avatar image |


## Example Usage ##

```
import com.lfm.services.UserData.Profile;
import flash.events.Event;

var profile:Profile = new Profile("RJ");
profile.addEventListener(Event.COMPLETE,serviceLoaded);
profile.load();

function serviceLoaded(event:Event):void {
    trace("Profile ID: " + profile.id);
    trace("Profile cluster: " + profile.cluster);
    trace("Profile username: " + profile.username);
    trace("Profile URL: " + profile.url);
    trace("Profile mbox_sha1sum" + profile.mboxsha1sum);
    trace("Profile Registered Date: " + profile.registered);
    trace("User age: " + profile.age);
    trace("User gender: " + profile.gender);
    trace("Country: " + profile.country);
    trace("Profile play count: " + profile.playcount);
    trace("Profile Avatar: " + profile.avatar);
}
```






