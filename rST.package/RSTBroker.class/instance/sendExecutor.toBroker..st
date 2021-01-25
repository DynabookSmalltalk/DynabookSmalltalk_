connection - client
sendExecutor: anExecutor toBroker: brokerIDString 
	"send anExecutor to brokerIDString"
	| resultTransporter result |
	self
		logMessage: ['sending:' , anExecutor asString].
	self
		withSocketTo: brokerIDString
		do: [:socket | 
			socket sendObject: anExecutor.
			resultTransporter _ socket getObject].
	self
		logMessage: ['sending:' , anExecutor asString , ' answer: ' , resultTransporter asString].
	result _ resultTransporter resolve.
	^ result