menus
addToBookmark
	| key value file filename |
	key _ self document head title ifNil: ['Untitled' translated].
	value _ self currentUrl.
	filename _ key,'.lin'.
	bookDir deleteFileNamed: filename. 
	file _ StandardFileStream fileNamed: (bookDir fullNameFor: filename).
	file ifNil:[self error: 'could not save file' translated].
	file nextPutAll: value asString. 
	file close.
	bookmark add: (Association key: key value: value).
	