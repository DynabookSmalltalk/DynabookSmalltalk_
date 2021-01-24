initializing
addVariables: aCollection ofType: aClass

	aCollection do: [ :variable |
		variables add: (aClass name: variable asString ) ]