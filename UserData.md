# UserData Package #

The com.lfm.services.UserData package contains all available services for retrieving information about a Last.fm user. You can import all of these at once in Actionscript 3.0 or individually depending on your needs.


# Examples #

**Importing all classes at once use:**
```
import com.lfm.services.UserData.*;

var profileInfo:Profile = new Profile("RJ");
var friendsList:Friends = new Friends("RJ");
```

**Importing individual classes:**
```
import com.lfm.services.UserData.Profile;
import com.lfm.services.UserData.Friends;

var profileInfo:Profile= new Profile("RJ");
var friendsList:Friends = new Friends("RJ");

```