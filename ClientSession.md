**Package**      com.lfm.client

**Class**        public class Session

**Inheritance**  Session



# Session Summary #

Before submitting tracks to a profile or using many other services like streaming a station, a session must be established with the Last.fm servers. This class takes care of establishing that session. The [Scrobbler class](http://code.google.com/p/lastfm-as3/wiki/ClientScrobbler) uses this class to be able to submit tracks. **A session is not needed for using the web services in this library, only scrobbling.**



## Details ##

| **Constructor Arguments** | **Summary** |
|:--------------------------|:------------|
| Username                  | (required) Last.fm username to retrieve the profile data for. |
| Password                  | (required) Password for the specified user. |
| ClientID                  | (optional) Sets the client id establishing a session. (defaults to "tst") |
| **Methods**               | **Summary** |
| create                    | Starts the session handshake process |
| **Events**                | **Summary** |
| status                    | Dispatched when a session handshake is complete (StatusEvent.STATUS) |
| ioError                   | Dispatched when there is a problem contacting the server (IOErrorEvent.IO\_ERROR) |
| **Properties** (read-only) | **Summary** |
| success (Boolean)         | If a proper session has been established, this will return true |
| status (String)           | The status code returned from the server after a handshake. |
| reason (String)           | If a handshake is unsuccessful, a reason may be returned. |
| id (String)               | The unique session id assigned with a successful handshake. |
| postURL (String)          | The URL to post submissions to. |
| npURL (String)            | The URL to post real-time now playing submissions to. |
| timestamp (Number)        | The timestamp that was used to generate an authentication string |


## Events ##
**ioError (IOErroEvent.IO\_ERROR)** - When the url (http://post.ausioscrobbler.com) cannot be reached (server downtime, etc), this error is dispatched.

**status (StatusEvent.STATUS)** - When the server is successfully reached, it returns a status code. This status code is parsed and dispatched through this event. You can read the status code and status level through the "code" and "level" properties of the event. Possible status code/level's:

| **Code** | **Level** | **Meaning** |
|:---------|:----------|:------------|
| OK       | status    | A successful session has been established with no errors. |
| BANNED   | error     | A session could not be established. The client id has been banned. |
| FAILED   | error     | A session could not be established. |
| BADAUTH  | error     | A session could not be established. |
| BADTIME  | error     | A session could not be established due to a bad timestamp being used to establish the session. |
| UNKNOWN  | error     | A session could not be established for an unknown reason. |


## Example Usage ##

```
import com.lfm.client.Session;

var lfmSession:Session = new Session("Username","Password");
lfmSession.addEventListener(IOErrorEvent.IO_ERROR, handshakeError);
lfmSession.addEventListener(StatusEvent.STATUS, statusHandler);
lfmSession.create();

function statusHandler(event:StatusEvent) {
    trace("Session status: "+event.code);
    trace("Session status level: "+event.level);
    trace("Session Success: "+lfmSession.success);
    trace("Session id: "+lfmSession.id);
}

function handshakeError(event:IOErrorEvent) {
   trace("Error connecting to the web service");
}

```









