testing
isSpecialCategoryName: aName

	^ aName = self class nullCategory
		or: [aName = self class allCategory]