address configuration
runClient
	"Initialize an broker in the port 8888 and get a remote reference to a  
	Date named today"
	Transcript show: 'running client side rST example...';
		 cr.
	""
	RSTBroker
		startOnPort: self clientPort
		logging: false.
	""
	self runClientTodayTests.
	self runClientCollectionTests.
	self runClientTranscriptTests.
	self runClientPersonTests.
	self runClientPerformanceTests.
	""
	Transcript show: 'everything is ok!';
		 cr