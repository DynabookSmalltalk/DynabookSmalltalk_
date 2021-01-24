conversion
mimeDecode
	"Do conversion reading from mimeStream writing to dataStream"

	| line lineStream c1 v1 c2 v2 |
	[(line := mimeStream nextLine) isNil] whileFalse: [
		line := line withoutTrailingBlanks.
		line 
			ifEmpty: [dataStream cr]
			ifNotEmpty: [
				lineStream := ReadStream on: line.
				[dataStream nextPutAll: (lineStream upTo: $=).
				lineStream atEnd] whileFalse: [
					c1 := lineStream next. v1 := c1 digitValue.
					((v1 between: 0 and: 15) and: [lineStream atEnd not])
						ifFalse: [dataStream nextPut: $=; nextPut: c1]
						ifTrue: [c2 := lineStream next. v2 := c2 digitValue.
							(v2 between: 0 and: 15)
								ifFalse: [dataStream nextPut: $=; nextPut: c1; nextPut: c2]
								ifTrue: [dataStream nextPut: (Character value: v1 * 16 + v2)]]].
				(line last ~= $= and: [mimeStream atEnd not]) ifTrue: [dataStream cr]]].
	^ dataStream