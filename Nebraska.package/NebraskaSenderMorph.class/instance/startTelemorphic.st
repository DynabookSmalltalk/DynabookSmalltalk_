as yet unclassified
startTelemorphic

	self world 
		connectRemoteUserWithName: self userName 
		picture: (userPicture ifNotNil: [userPicture scaledToSize: 16@20]) 
		andIPAddress: self ipAddress
