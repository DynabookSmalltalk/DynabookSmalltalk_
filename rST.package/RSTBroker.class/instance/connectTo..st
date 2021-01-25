connection - client - sockets
connectTo: brokerIDString 
	"open a socket to brokerIDString"
	| addressAndPort socket |
	addressAndPort _ self addressAndPort: brokerIDString.
	""
	socket _ nil.
	10
		timesRepeat: [""
			socket notNil
				ifTrue: [socket closeAndDestroy].
			socket _ Socket new.
			socket connectTo: addressAndPort first port: addressAndPort second.
			socket waitForConnectionUntil: Socket standardDeadline.
			socket isConnected
				ifTrue: [^ socket].
			(Delay forMilliseconds: 100) wait].
	self error: 'Can''t connect to: ', brokerIDString asString