class initialization
initialize
	"register the receiver in the global registries"
	self environment
		at: #FileServices
		ifPresent: [:cl | cl registerFileReader: self]