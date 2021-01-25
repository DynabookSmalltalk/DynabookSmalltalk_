allocating
allocateBlockContext: nWords
	"not supported in Spur - nil is fine for Etoys projects"
	^nil
	"| homeOop methodOop method |
	homeOop := self uint32At: position + 24.
	methodOop := self uint32At: homeOop + 16.
	method := self readObjectAt: methodOop.
	^BlockContext newForMethod: method"