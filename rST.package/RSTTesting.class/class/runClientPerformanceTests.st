testing - client side
runClientPerformanceTests
	| remoteToday localToday remoteTomorrow |
	localToday _ Date today.
	""
	remoteToday _ ('today@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	remoteTomorrow _ remoteToday addDays: 1.
	MessageTally
		spyOn: [100
				timesRepeat: [remoteTomorrow subtractDate: localToday]]