ui
representsSameBrowseeAs: anotherModel 
	^ self class = anotherModel class
	and: [ items = anotherModel items ]