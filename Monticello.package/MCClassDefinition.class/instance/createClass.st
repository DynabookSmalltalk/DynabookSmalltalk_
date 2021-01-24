installing
createClass
	| environment superClass class composition |
	environment := Environment current.
	superClass := superclassName == #nil ifFalse:
					[environment valueOf: superclassName
						ifAbsent: [(KeyNotFound key: superclassName) signal]].
	[class := (ClassBuilder new)
			name: name 
			inEnvironment: environment
			subclassOf: superClass
			type: type 
			instanceVariableNames: self instanceVariablesString 
			classVariableNames: self classVariablesString 
			poolDictionaries: self sharedPoolsString
			category: category.
	] on: Warning, DuplicateVariableError do:[:ex| ex resume].

	"The following is written to support traits unloading"
	composition := self traitComposition ifNil: [Array empty] ifNotNil: [:traitComposition | Compiler evaluate: traitComposition].
	(composition isCollection and:[composition isEmpty and:[class traitComposition isEmpty]]) ifFalse:[
		class setTraitComposition: composition asTraitComposition.
	].

	composition := self classTraitComposition ifNil: [Array new] ifNotNil: [:traitComposition | Compiler evaluate: traitComposition].
	(composition isCollection and:[composition isEmpty and:[class class traitComposition isEmpty]]) ifFalse:[
		class class setTraitComposition: composition asTraitComposition.
	].

	^class