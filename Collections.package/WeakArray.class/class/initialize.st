class initialization
initialize
	"WeakArray initialize"

	"Do we need to initialize specialObjectsArray?"
	Smalltalk specialObjectsArray size < 42 
		ifTrue:[Smalltalk recreateSpecialObjectsArray].

	Smalltalk addToStartUpList: self.
	self restartFinalizationProcess.