setup
setUp
	"it would be nice to have an in-image loopback socket, so that the tests do not need the underlying platform's sockets to behave nicely"
	socket1 := Socket newTCP.
	socket2 := Socket newTCP.
	
	socket1 listenOn: 9999.
	socket2 connectTo: (NetNameResolver localHostAddress) port: socket1 port.

	socket1 waitForConnectionFor: 60.	
	socket2 waitForConnectionFor: 60.
	
	end1 := ArbitraryObjectSocket on: socket1.
	end2 := ArbitraryObjectSocket on: socket2.
	