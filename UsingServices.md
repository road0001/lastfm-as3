## Introduction ##

The AS3 library for Last.fm web services was made for developers to easily access and use data provided by Last.fm for whatever applications they can come up with. Because of the architecture of the code, using the services is a fairly uniform, flexible and easy task.

## Examples of use ##

You must first import the service(s) you intend to use. For example, if you want to grab the top tags of a users friends you would need the Friends class and TopTags class using the import statement. Most every user-based class takes a username as the constructor argument. You can add an event listener to detect when the friends list is done loading, then simply call the load() method.

```
import com.lfm.services.UserData.Friends;
import com.lfm.services.UserData.TopTags;

var tagsData:TopTags;
var friendsData:Friends = new Friends("user");
friendsData.addEventListener(Event.COMPLETE, friendsHandler);
friendsData.load();

function friendsHandler(event:Event) {
    trace(friendsData.friends.length + " friends loaded!");
    //Get the top tags for the first friend.
    var tagsData = new TopTags(friendsData.friends[0]['name']);
    tagsData.addEventListener(Event.COMPLETE, tagsHandler);
    tagsData.load();
}

function tagsHandler(event:Event) {
    //Top tag for first friend.
    trace("Top tag for " + tagsData.username + ": " + tagsData.tags[0]['name']);
}

```

Simple as creating the object and telling it to load!