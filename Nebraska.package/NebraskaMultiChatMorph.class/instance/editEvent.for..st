as yet unclassified
editEvent: anEvent for: aMorph

	| answer initialText aFillInTheBlankMorph |

	(aMorph bounds containsPoint: anEvent cursorPoint) ifFalse: [^self].
	initialText := String streamContents: [ :strm |
		targetIPAddresses do: [ :each | strm nextPutAll: each; cr].
	].
	aFillInTheBlankMorph := FillInTheBlankMorph new
		setQuery: 'Who are you chatting with?' translated
		initialAnswer: initialText
		answerHeight: 250
		acceptOnCR: false.
	aFillInTheBlankMorph responseUponCancel: nil.
	self world addMorph: aFillInTheBlankMorph centeredNear: anEvent cursorPoint.
	answer := aFillInTheBlankMorph getUserResponse.
	answer ifNil: [^self].
	self updateIPAddressField: (answer findTokens: ' ',String cr).

