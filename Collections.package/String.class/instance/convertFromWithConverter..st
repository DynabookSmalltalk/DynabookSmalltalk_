converting
convertFromWithConverter: converter

	^(converter ifNil: [ ^self]) decodeString: self