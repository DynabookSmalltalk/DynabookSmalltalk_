private
cacheAllFileNamesDuring: aBlock
	"FileBasedRepository's can only access all version-names, therefore this is provided to allow client-code to direct caching of getting all filenames.  Other types of repositories offer more sophisticated kinds of access, so they don't need to cache, so simply run the block."
	^ aBlock value