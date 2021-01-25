accessing
allNamed: nameObject 
	"answer all object named nameObject"
	| named |
	named _ Set new.
	mutex
		critical: [""
			remembered
				keysAndValuesDo: [:object :names | ""
(names keys includes:nameObject)
ifTrue:[named add: object]
]].
	^ named