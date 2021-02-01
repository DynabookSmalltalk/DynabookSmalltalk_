class initialization
unload
	"Unload the receiver from global registries"
	self environment
		at: #FileServices
		ifPresent: [:cl | cl unregisterFileReader: self]