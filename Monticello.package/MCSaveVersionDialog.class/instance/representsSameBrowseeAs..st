ui
representsSameBrowseeAs: anotherModel 
	^ self class = anotherModel class
	and: [ self versionName = anotherModel versionName ]