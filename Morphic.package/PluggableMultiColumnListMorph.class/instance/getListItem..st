model access
getListItem: modelIndex
	"Return a row full of items."
	
	^ getListElementSelector
		ifNotNil: [:sel | model perform: sel with: modelIndex ]
		ifNil: [self getFullList collect: [:column | column at: modelIndex]]