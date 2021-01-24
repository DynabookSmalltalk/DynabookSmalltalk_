private
setString: aString setRunsChecking: aRunArray
	| stringSize runsSize |
	string := aString.
	aRunArray ifNil: [^ aString asText].
	
	"Check runs and do the best you can to make them fit..."
	aRunArray runs size = aRunArray values size ifFalse: [^ aString asText]. "raise error here?"
	runsSize := aRunArray size.
	stringSize := string size.
	runs := stringSize = runsSize
				ifTrue: [aRunArray]
				ifFalse: [ stringSize > runsSize
						ifTrue: [aRunArray  add: {} withOccurrences: stringSize - runsSize]
						ifFalse: [aRunArray copyFrom: 1 to: stringSize]].