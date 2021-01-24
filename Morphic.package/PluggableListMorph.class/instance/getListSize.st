model access
getListSize
	"return the current number of items in the displayed list"
	
	^ getListSizeSelector
		ifNotNil: [:sel | model perform: sel]
		ifNil: [self fullListSize]