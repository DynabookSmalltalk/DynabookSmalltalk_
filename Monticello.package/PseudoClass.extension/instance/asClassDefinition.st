*monticello
asClassDefinition
	^ MCClassDefinition
		name: self name
		superclassName: self superclass name
		category: self category 
		instVarNames: self instVarNames
		classVarNames: self classVarNames
		poolDictionaryNames: self poolDictionaryNames
		classInstVarNames: self classInstVarNames
		type: self typeOfClass
		comment: self organization classComment asString
		commentStamp: self organization commentStamp	