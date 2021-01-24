converting
asColorizedSmalltalk80Text
	"Answer a colorized Smalltalk-80-syntax string description of the parse tree whose root is the receiver."

	| printText |
	printText := self printString asText.
	^(Smalltalk at: #SHTextStylerST80 ifAbsent: [nil])
		ifNotNil: [:stylerClass| stylerClass new styledTextFor: printText]
		ifNil: [printText]