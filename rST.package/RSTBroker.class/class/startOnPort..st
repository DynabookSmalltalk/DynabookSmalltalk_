running
startOnPort: portInteger 
	"start the Broker with the default features"
	^ self
		startOnPort: portInteger
		logging: false
		