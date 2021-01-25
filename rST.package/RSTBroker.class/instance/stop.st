private - running
stop
	"PRIVATE: use RSTBroker stop"
	self stopNetwork.
	"
	uncomment when connection error get handled
	self sendGoodbye."
	status _ #stoped.
	self
		logMessage: ['Stoped!']