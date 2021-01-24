initialize-release
initialize
	super initialize.
	Smalltalk at: #SMSqueakMap ifPresent:[:aClass|
		smCache := aClass default cache.
	].