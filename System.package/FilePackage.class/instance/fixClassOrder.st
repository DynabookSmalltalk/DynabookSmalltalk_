accessing
fixClassOrder
	"Essentially bubble sort the classOrder so that superclasses appear before subclasses"
	| superClass index subClass superIndex |
	index := 0.
	[index < classOrder size] whileTrue:[
		subClass := classOrder at: (index := index + 1).
		superClass := nil.
		subClass isMeta ifTrue:[
			"Treat non-meta as superclass"
			superClass := self classes at: subClass name ifAbsent:[nil].
		] ifFalse:[
			subClass hasDefinition ifTrue:[
				superClass := self classes 
					at: (Scanner new scanTokens: subClass definition) first ifAbsent:[nil].
				superClass ifNotNil:[superClass hasDefinition ifFalse:[superClass := nil]].
			].
		].
		superClass ifNotNil:[
			superIndex := classOrder indexOf: superClass ifAbsent:[self error:'Where is the class?'].
			superIndex > index ifTrue:[
				"Move superClass before index"
				classOrder remove: superClass.
				classOrder add: superClass before: subClass.
				"Rewind index - we need to check superClass itself"
				index := index - 1.
			].
		].
	].
