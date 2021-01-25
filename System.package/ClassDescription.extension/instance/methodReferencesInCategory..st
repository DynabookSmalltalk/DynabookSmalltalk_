*System
methodReferencesInCategory: aCategoryName
	^(self organization listAtCategoryNamed: aCategoryName)
		collect: [:ea | MethodReference new
						setClassSymbol: self theNonMetaClass name
						classIsMeta: self isMeta
						methodSymbol: ea
						stringVersion: '']
