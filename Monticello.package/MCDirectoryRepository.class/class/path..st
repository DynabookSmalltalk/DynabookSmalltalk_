instance creation
path: fullyQualifiedName 
	^ self directory: (FileDirectory on: fullyQualifiedName)