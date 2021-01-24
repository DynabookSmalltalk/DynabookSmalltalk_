instance creation
location: urlOrPath
	"Answer an MCRepository for the given url or path. Accepted locations are:
		- http, and ftp urls (i.e., http://source.squeak.org/trunk)
		- directory paths (i.e., C:\Squeak\packages)
		- directory matches (i.e., C:\Squeak\packages\*)
	"

	^self location: urlOrPath username: '' password: ''