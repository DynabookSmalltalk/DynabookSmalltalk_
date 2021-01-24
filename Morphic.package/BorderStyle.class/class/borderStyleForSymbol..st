instance creation
borderStyleForSymbol: sym
	"Answer a border style corresponding to the given symbol"

	| aSymbol |
	aSymbol := sym == #none ifTrue: [#simple] ifFalse: [sym].
	^ (self borderStyleChoices includes: aSymbol)
		ifTrue: [self perform: aSymbol]
		ifFalse: [nil]
"
	| aSymbol selector |
	aSymbol := sym == #none ifTrue: [#simple] ifFalse: [sym].
	selector := Vocabulary eToyVocabulary translationKeyFor: aSymbol.
	selector isNil ifTrue: [selector := aSymbol].
	^ self perform: selector
"
