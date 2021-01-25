like fullCopy
fixDependents
	"They are not used much, but need to be right"

	DependentsFields associationsDo: [:pair |
		pair value do: [ :dependent | 
			(references at: dependent ifAbsent: nil) ifNotNil: [ :newDependent |
				(references at: pair key ifAbsent: [ pair key ])
					addDependent: newDependent ] ] ]