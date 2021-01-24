model access
getListItem: modelIndex
	
	^ getListElementSelector
		ifNotNil: [:sel | model perform: sel with: modelIndex ]
		ifNil: [self getFullList at: modelIndex]