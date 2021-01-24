styling
aboutToStyle: aStyler
	
	| classDefinition shouldStyle |
	classSelection ifNil: [ ^false ].
	self switchIsComment ifTrue: [ ^false ].
	methodSelection 
		ifNotNil: [ 
			classDefinition := items 
				detect: [:ea | 
					ea isClassDefinition and: [ ea className = classSelection ] ]
				ifNone: [ 
					(Smalltalk at: classSelection ifAbsent: [ Object ]) asClassDefinition ].
			shouldStyle := true ]
		ifNil: [ 
			classDefinition := nil.
			shouldStyle := categorySelection ~= self extensionsCategory ].
	(Smalltalk classNamed: #SHMCClassDefinition) 
		ifNil: [ ^false ]
		ifNotNil: [ :SHMCClassDefinition |
			aStyler 
				environment: self;
				classOrMetaClass: (classDefinition ifNotNil: [
					SHMCClassDefinition 
						classDefinition: classDefinition 
						items: items 
						meta: switch = #class ]) ].
	^shouldStyle