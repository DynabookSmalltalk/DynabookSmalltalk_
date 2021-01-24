morphic ui
representsSameBrowseeAs: anotherModel 
	^ self class = anotherModel class
	and: [ self repository = anotherModel repository ]