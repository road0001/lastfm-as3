This is an Actionscript 3.0 API to access all the available Last.fm web services. This should hopefully save some people time from doing all the grunt work of parsing feeds and sorting through all that lovely data that Last.fm provides. It is currently a work in progress so not all the services are currently available. The packages are divided similar to the audioscrobbler services page: http://www.audioscrobbler.net/data/webservices/ (UserData, ArtistData, etc).
Documentation is also an important goal of this project so keep an eye on the ever-growing wiki. These packages can be used in Adobe Flex, AIR, or Flash applications.

**Update 09-15-2007:** Completed wiki for all User Data services. Also reworked some code / events in the Session class and update it's wiki page.


**Update 09-12-2007:** Added all services for retrieving user information from the Last.fm services. These include:
  * [Profile Information](UserDataProfile.md)
  * [Top Artists](UserDataTopArtists.md)
  * [Top Albums](UserDataTopAlbums.md)
  * [Top Tracks](UserDataTopTracks.md)
  * [Top Tags](UserDataTopTags.md)
  * [Top Tags for Artist](UserDataTopArtistTags.md)
  * [Top Tags for Album](UserDataTopAlbumTags.md)
  * [Top Tags for Track](UserDataTopTrackTags.md)
  * [Friends List](UserDataFriends.md)
  * [Neighbours](UserDataNeighbours.md)
  * [Recent Tracks](UserDataRecentTracks.md)
  * [Recent Banned Tracks](UserDataRecentBannedTracks.md)
  * [Recent Loved Tracks](UserDataRecentLovedTracks.md)
  * [Recent Journals](UserDataRecentJournals.md)
  * [Weekly Chart List](UserDataWeeklyChartList.md)
  * [Weekly Artists Chart](UserDataWeeklyArtistsChart.md)
  * [Weekly Albums Chart](UserDataWeeklyAlbumsChart.md)
  * [Weekly Tracks Chart](UserDataWeeklyTracksChart.md)
  * [Manual Recommendations](UserDataManualRecommendations.md)
  * [System Recommendations](UserDataSystemRecommendations.md)
  * [User Events / Friends' Events / System Event Recommendations](UserDataUserEvents.md)
  * [Taste-O-Meter](UserDataTasteOMeter.md)

Also added was a [scrobbling class](ClientScrobbler.md) using the latest 1.2 submission protocol.