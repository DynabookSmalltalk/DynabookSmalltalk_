initialize-release
rehashAll
	"HashedCollection rehashAll"	
		
	self allSubclassesDo: [ :each | each rehashAllInstances ]