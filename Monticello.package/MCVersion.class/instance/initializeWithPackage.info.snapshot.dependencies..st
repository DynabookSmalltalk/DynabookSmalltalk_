initialize-release
initializeWithPackage: aPackage info: aVersionInfo snapshot: aSnapshot dependencies: aCollection 
	self
		setPackage: aPackage
		info: aVersionInfo
		snapshot: aSnapshot
		dependencies: aCollection.
	self addToCache