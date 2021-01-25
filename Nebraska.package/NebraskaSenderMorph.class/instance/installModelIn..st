debug and other
installModelIn: myWorld

	"if we get this far and nothing exists, make it up"

	userPicture ifNotNil: [^self].
	self
		userName: Preferences defaultAuthorName 
		userPicture: nil 
		userEmail: 'who@where.net' 
		userIPAddress: NetNameResolver localAddressString
