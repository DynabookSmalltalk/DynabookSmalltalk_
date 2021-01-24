model access - cached
getFullList
	"The full, unfiltered list. Cached result, see #updateList. Prefer getListSelector over getListElementSelector if both a set."
	
	^ fullList ifNil: [
		fullList := getListSelector
			ifNotNil: [:sel | model perform: sel]
			ifNil: [(getListSizeSelector notNil and: [getListElementSelector notNil])
				ifTrue: [	(1 to: self getListSize) collect: [:index | self getListItem: index]]
				ifFalse: [#() "We cannot get the full list."]].
		fullList ifNil: [Error signal: 'The model must never provide ''nil'' as a list but only a collection.'].
		fullList]