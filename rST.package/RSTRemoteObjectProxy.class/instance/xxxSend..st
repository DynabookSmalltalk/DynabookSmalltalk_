system primitives
xxxSend: aMessage 
	"send this message to the remote object represented by me"
	^ RSTBroker instance sendMessage: aMessage to: remoteObjectID