running
startOnPort: portInteger logging: loggingBoolean
	"start the Broker with full control of features"
	self stop.
	^ instance _ super new
				startOnPort: portInteger
				logging: loggingBoolean