testing - client side
runClientPersonTests
	""
	| remotePerson1 remotePerson2 vc1 vc2 |
	remotePerson1 _ ('person1@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	remotePerson2 _ ('person2@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	""
	vc1 _ RSTPersonViewController on: remotePerson1.
	vc2 _ RSTPersonViewController on: remotePerson2.
	""
	vc1 test
		ifFalse: [self error: 'something wrong!'].
	vc2 test
		ifFalse: [self error: 'something wrong!']