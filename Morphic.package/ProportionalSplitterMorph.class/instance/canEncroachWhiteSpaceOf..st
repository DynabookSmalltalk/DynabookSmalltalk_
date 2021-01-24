smart splitters - queries
canEncroachWhiteSpaceOf: morphs 
	^ morphs allSatisfy: [ : each | each canBeEncroached ]