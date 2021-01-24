initialize-release
compactAll
	"HashedCollection compactAll"	
		
	self allSubclassesDo: [ :each | each compactAllInstances ]