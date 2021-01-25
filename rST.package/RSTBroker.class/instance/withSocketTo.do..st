connection - client - sockets
withSocketTo: brokerIDString do: aBlock 
	"evaluate aBlock when an open socket to brokerIDString"
	| socket |
	socket _ self connectTo: brokerIDString.
	[aBlock value: socket]
		ensure: [socket closeAndDestroy]