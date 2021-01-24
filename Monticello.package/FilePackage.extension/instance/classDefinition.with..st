*monticello
classDefinition: string with: chgRec
	| tokens theClass |
		
	tokens := Scanner new scanTokens: string.

	"tokens size = 11 ifFalse:[^doIts add: chgRec]."

	theClass := self getClass: (tokens at: 3).
	theClass definition: string.
	classOrder add: theClass.