running
testBogusInput1
	| negString |
	negString := String new: 4.
	negString putInteger32: -10 at: 1.
	socket1 sendData: negString.
	10 milliSeconds asDelay wait. "data sent, wait a few milliseconds"
	end2 processIO.
	
	self should: [ end2 isConnected not ].
	