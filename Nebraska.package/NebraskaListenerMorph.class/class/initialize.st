class initialization
initialize
"
EToyListenerMorph initialize
"
	
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self.
