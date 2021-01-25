class initialization
initialize
"Add me to the system startup list and make sure to do a file-in init for first time loading"
"HostWindowProxy initialize"
	self setDefaultWindowProxyClass.
	Smalltalk addToStartUpList: self.