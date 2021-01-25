testing - client side
runClientTodayTests
	"Initialize an broker in the port 8888 and get a remote reference to a  
	Date named today"
	| remoteToday localToday remoteTomorrow localTomorrow elapsed |
	localToday _ Date today.
	localTomorrow _ localToday addDays: 1.
	""
	"you must change the IP if you run the example in diferents machines"
	remoteToday _ ('today@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	remoteToday inspect.
	" 
	hash return an integer so i receive a copy and the #= is a local  
	message"
	localToday hash = remoteToday hash
		ifFalse: [self error: 'something wrong!'].
	" 
	remoteTomorrow is an remote object"
	remoteTomorrow _ remoteToday addDays: 1.
	remoteTomorrow isRemote
		ifFalse: [self error: 'something wrong!'].
	localTomorrow julianDayNumber = remoteTomorrow julianDayNumber
		ifFalse: [self error: 'something wrong!'].
	"pass a reference to a local object (localTomorrow)"
	elapsed _ remoteTomorrow subtractDate: localTomorrow.
	elapsed isRemote
		ifTrue: [self error: 'something wrong!'].
	elapsed isZero
		ifFalse: [self error: 'something wrong!']