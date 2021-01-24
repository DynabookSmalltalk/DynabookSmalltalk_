instance creation
baseTraitName: aString classTraitComposition: classTraitCompositionString
	^self instanceLike: (
		self new
			initializeWithBaseTraitName: aString
			classTraitComposition: classTraitCompositionString).