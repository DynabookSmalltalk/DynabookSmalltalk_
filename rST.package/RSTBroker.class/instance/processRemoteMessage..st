connection - server
processRemoteMessage: aRemoteMessage 
	"send aRemoteMessage to the local receiver"
	| target localArguments |
	self
		logMessage: ['received remote message: ' , aRemoteMessage asString].
	target _ exportedObjects
				at: aRemoteMessage to objectID
				ifAbsent: [^ RSTObjectTransporter
						exception: (RSTObjectNotFound new messageText: aRemoteMessage to objectID asString)].
	""
	localArguments _ aRemoteMessage arguments
				collect: [:each | each resolve].
	[| result | 
	result _ target perform: aRemoteMessage selector withArguments: localArguments.
	^ self transporterFor: result]
		on: Exception
		do: [:exception | 
			self logException: exception.
			^ RSTObjectTransporter
				exception: (RSTRemoteException on: exception)]