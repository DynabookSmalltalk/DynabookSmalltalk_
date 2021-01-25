testing - client side
runClientTranscriptTests
	| remoteTranscript |
	remoteTranscript _ ('Transcript@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	remoteTranscript show: 'everything is ok! (from client side)';
		 cr