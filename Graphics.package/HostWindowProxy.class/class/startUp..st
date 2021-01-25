system startup
startUp: resuming
	resuming ifFalse: [^self].
	"system startup - find the appropriate proxy class for this platform"
	self setDefaultWindowProxyClass.
	"any currently extant instances must tell their sourceForm to resetProxy in order to kill potentially wrong-platform versions and reset to correct-platform"
	self registry keys do: [:i | i resetProxy]