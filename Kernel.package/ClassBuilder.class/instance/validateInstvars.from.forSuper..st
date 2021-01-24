validation
validateInstvars: instVarArray from: oldClass forSuper: newSuper 
	"Check if any of the instVars of oldClass conflict with the new superclass"
	| usedNames |
	usedNames := instVarArray asSet.
	oldClass ifNotNil: [ oldClass withAllSubclassesDo: [ : each | each == oldClass ifFalse: [usedNames addAll: each instVarNames] ] ].
	"Anything to possibly conflict?"
	usedNames isEmpty ifTrue: [ ^ true ].
	newSuper allowsSubInstVars ifFalse:
		[ self error: newSuper printString , ' does not allow subclass inst vars. See allowsSubInstVars.'.
		^ false ].
	instVarArray asSet size = instVarArray size ifFalse:
		[ self error: instVarArray asBag sortedCounts first value, ' is multply defined.'.
		^ false ].
	(usedNames intersection: self reservedNames) ifNotEmpty:
		[ : reservedWords | self error: reservedWords anyOne , ' is a reserved name'.
		^ false ].
	newSuper ifNotNil:
		[ | offendingVars |
		"If any variable names in subclasses conflict names in the new superclass, report the offending class and instVar name."
		newSuper withAllSuperclasses
			detect: [ : each | (offendingVars := each instVarNames intersection: usedNames) notEmpty ]
			ifFound:
				[ : offendingSuperclass | 
				DuplicateVariableError new
					 superclass: offendingSuperclass ;
					 variable: offendingVars anyOne ;
					 signal: offendingVars anyOne , ' is already defined in ' , offendingSuperclass name ]
			ifNone: [ "no name conflicts" ] ].
	^ true