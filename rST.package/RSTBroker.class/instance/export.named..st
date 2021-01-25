connection - server
export: anObject named: aString 
	"export anObject with name aString, so other squeaks can connect to  
	anObject with:  
	remoteObject _ 'aString@localip:port' asRemoteObjectID asLocalObject."
	anObject remoteType == #copy
		ifTrue: [self
				logWarning: ['exporting object with #remoteType == #copy (' , anObject asString , ')']].
	rememberer rememberForEver: anObject naming:aString.
	exportedObjects at: aString put: anObject.
	self
		logMessage: ['object: ' , anObject asString , ' exported with name:' , aString]