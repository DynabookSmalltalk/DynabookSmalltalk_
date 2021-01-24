private
allVersionNames
	^ allVersionNames ifNil:
		[ self initializeVersionNames.
		allVersionNames ]