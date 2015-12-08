**Package**      com.lfm.client

**Class**        public class Scrobbler

**Inheritance**  Scrobbler

**Dependency**  [com.lfm.client.Session](http://code.google.com/p/lastfm-as3/wiki/ClientSession), com.lfm.model.Track


# Scrobbler Summary #

"Scrobbles" tracks to a specified Last.fm profile using the [1.2 submission protocol](http://www.audioscrobbler.net/development/protocol/)


## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username/profile to submit tracks to. |
| Password                  | (required) Password for the specified user. |
| **Methods**               | **Summary** |
| connect                   | Establishes a session with the last.fm web service |
| submit                    | Method accepts a single Track object to submit. |
| submitNowPlaying          | Method accepts a single Track object to submit for real-time information (not yet tested) |
| **Events**                | **Summary** |
| complete                  | Dispatched when a a track submission is complete (Event.COMPLETE) |
| connect                   | Dispatched when a [session](http://code.google.com/p/lastfm-as3/wiki/ClientSession) has been established and ready to scrobble (Event.CONNECT) |
| error                     | Dispatched when a session was unable to be established (ErrorEvent.ERROR). Use the text property of the event to see details |
| init                      | Dispatched when a track submission has started (Event.INIT) |
| ioError                   | Dispatched when a session could not be established or a submission failure.  Use the text property for details. (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| ready (Boolean)           | If a proper session has been established, ready will return true |


## Example Usage ##

```
import com.lfm.client.Scrobbler;
import com.lfm.model.Track;

var scrobbler:Scrobbler = new Scrobbler("Username","Password");
scrobbler.addEventListener(Event.CONNECT,scrobblerReady);
scrobbler.addEventListener(Event.COMPLETE,scrobbleHandler);
scrobbler.connect();

var track:Track = new Track();
track.artist = "The Decemberists";
track.title = "Here I Dreamt I Was an Architect";
track.album = "Castaways and Cutouts";
track.length = 269;
track.source = Track.SOURCE_USER;
track.timestamp = Track.dateToTimestamp(new Date());

function scrobblerReady(event:Event) {
    scrobbler.submit(track);
}

function scrobbleHandler(event:Event) {
    trace("Track scrobbled!");
}
```



