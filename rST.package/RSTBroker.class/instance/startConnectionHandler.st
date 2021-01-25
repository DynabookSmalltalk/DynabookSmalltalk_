private - running
startConnectionHandler
	connectionHandler _ ConnectionHandler
				onPort: port
				handler: self
				priority: Processor highIOPriority.
	connectionHandler start.