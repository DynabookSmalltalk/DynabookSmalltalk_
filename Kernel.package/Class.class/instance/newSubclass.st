subclass creation
newSubclass

	self flag: #uniclasses.	
	^ self newUniqueClassInstVars: '' classInstVars: ''

"Point newSubclass new"