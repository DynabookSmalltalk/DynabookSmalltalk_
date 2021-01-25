remembering & forgetting
forget: anObject named: nameObject 
	"forget anObject"
	mutex
		critical: [| names | 
			names _ remembered
						at: anObject
						ifAbsent: [^ anObject].
			names
				removeKey: nameObject
				ifAbsent: [].
			names isEmpty
				ifTrue: [remembered removeKey: anObject]]