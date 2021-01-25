as yet unclassified
for: aReadStream withPos: pos

	^ aReadStream atEnd
		ifTrue: [OM2EndOfStream new initStream: aReadStream pos: pos]
		ifFalse: [self new initHead: aReadStream next stream: aReadStream pos: pos]