accessing - features
findFeaturesDo: aBlock
	"Simple analysis of natural language in source code. Select all features that are letters only, normalize them as lowercase. No support for word stemming.
	
	Example:
		'Transcript show: 123 asString; cr; show: #HelloWorld.'
			-> #('transcript' 'show' 'as' 'string' 'cr' 'show' 'hello' 'world')
	"

	self findFeatureIndicesDo: [:start :end |
		(self at: start) isLetter ifTrue: [
			aBlock value: (self copyFrom: start to: end) asLowercase]].