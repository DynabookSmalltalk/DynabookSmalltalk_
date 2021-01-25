initialize-release
initialize
	"
	RSTBroker initialize
	"
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self