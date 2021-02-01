initialize-release
unload
	"Unload the receiver from global registries"

	self environment
		at: #FileServices
		ifPresent: [:cl | cl unregisterFileReader: self].
	self environment
		at: #Flaps
		ifPresent: [:cl | cl unregisterQuadsWithReceiver: self]