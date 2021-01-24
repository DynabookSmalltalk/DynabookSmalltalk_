formatting
format: arguments 
	"format the receiver with arguments, respecting the format both of receiver and collection elements"
	
	^self class new: self size * 11 // 10 streamContents: [ :output |
		| nextIndex |
		nextIndex := 1.
		[ nextIndex <= self size ] whileTrue: [
			(self at: nextIndex) caseOf: {
				[$\] -> [
					nextIndex := nextIndex + 1.
					output withAttributes: (runs at: nextIndex) do: [
						output nextPut: (self at: nextIndex) ] ].
				[${] -> [
					"Parse the index - a positive integer in base 10."
					| character collectionIndex attributes |
					collectionIndex := 0.
					attributes := Set new.
					[ (character := string at: (nextIndex := nextIndex + 1)) isDigit ] whileTrue: [
						collectionIndex := collectionIndex * 10 + character digitValue.
						attributes addAll: (runs at: nextIndex) ].
					character = $} ifFalse: [ self error: '$} expected' ].
					output withAttributes: attributes do: [
						output nextPutAll: (arguments at: collectionIndex) asStringOrText ] ] }
				otherwise: [
					output withAttributes: (runs at: nextIndex) do: [
						output nextPut: (self at: nextIndex) ] ].
			nextIndex := nextIndex + 1 ] ]