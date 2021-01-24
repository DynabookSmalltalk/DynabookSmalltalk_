private
cacheAllFileNamesDuring: aBlock 
	"Cache the result of #allFileNames and #allVersionNames during aBlock"
	allFileNamesCache ifNotNil: [ ^ aBlock value ].
	self cacheAllFilenames.
	^ aBlock ensure: [ allFileNamesCache := allVersionNamesCache := nil ]