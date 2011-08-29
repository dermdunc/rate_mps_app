This is a small self-contained web app in Ruby on Rails providing the ability to store metadata for a number of Mp3 files, rate them, and generate randomized playlists in m3u format.  

The requirements:
- Mp3 file model with basic metadata (url, title, artist name, length in seconds)
- Rating model allowing the user to assign ratings to an mp3 (scale of 1 to 5). Number of ratings per tune is unconstrained, and a tune’s rating is considered to be the average of all ratings of that tune.
- User interface to list, add and remove Mp3s to/from the app 
- User interface to add a rating to an Mp3.
- Dynamically generated playlist in Extended M3U format that will include all matching songs from the database in random order, that can be optionally filtered on any combination of the following criteria
	- by artist name
	- by user-selectable minimum rating
Unit, functional and integration tests are provided using RSpec in conjunction with spork and autotest.