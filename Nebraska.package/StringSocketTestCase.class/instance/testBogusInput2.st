running
testBogusInput2
	| bogoString |
	bogoString := String new: 8.
	bogoString putInteger32: 2 at: 1.
	bogoString putInteger32: -10 at: 5.
	socket1 sendData: bogoString.
	10 milliSeconds asDelay wait. "data sent, wait a few milliseconds"
	end2 processIO.
	
	self should: [ end2 isConnected not ].
	