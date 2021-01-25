running
startOnPort: portInteger logging: loggingBoolean 
	"start this broker"
	port _ portInteger.
	logging _ loggingBoolean.
	""
	self initialize.
	""
	status _ #running.
	self
		logMessage: ['rSTBroker running as ' , brokerID asString]