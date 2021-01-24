instance creation
location: urlOrPath username: user password: pass
	"Answer an MCRepository for the given url or path. Accepted locations are:
		- http, and ftp urls (i.e., http://source.squeak.org/trunk)
		- directory paths (i.e., C:\Squeak\packages)
		- directory matches (i.e., C:\Squeak\packages\*)
	If provided, the supplied user name and password will be used."

	| url |
	(urlOrPath findString: '://') > 0 ifTrue:[
		url := urlOrPath asUrl.
		^ url scheme caseOf: {
			['ftp'] -> [MCFtpRepository 
							host: url authority
							 directory: url pathString allButFirst
							user: user 
							password: user].
			['http'] -> [MCHttpRepository 
							location: urlOrPath 
							user: user 
							password: pass].
		} otherwise:[self error: 'Unsupported scheme: ', url scheme].
	].

	(urlOrPath endsWith: '*') ifTrue:[
		^MCSubDirectoryRepository new 
				directory: (FileDirectory on: urlOrPath allButLast)].

	^MCDirectoryRepository
			directory: (FileDirectory on: urlOrPath)