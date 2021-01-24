private
db
	(connection isNil or: [connection isConnected not]) ifTrue: [
		connection := Smalltalk at: #KKDatabase ifPresent: [:cl | 
			cl  onHost:hostname port: port
		]
	].
	^ connection