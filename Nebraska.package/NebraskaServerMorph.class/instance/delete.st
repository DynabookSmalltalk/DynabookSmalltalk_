submorphs-add/remove
delete
	self server ifNotNil:[
		(self confirm:'Shutdown the server?' translated) 
			ifTrue:[self world remoteServer: nil]].
	super delete.