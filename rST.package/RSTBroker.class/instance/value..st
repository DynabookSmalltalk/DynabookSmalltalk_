connection - server
value: aSocket 
	"this method is invoked by ConnectioHandler when a new connection is  
	established"
	[self process: aSocket]
		forkAt: Processor lowIOPriority