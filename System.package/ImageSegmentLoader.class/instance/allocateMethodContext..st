allocating
allocateMethodContext: nWords
	"not supported in Spur - nil is fine for Etoys projects"
	^nil
	"| methodOop method |
	methodOop := self uint32At: position + 16.
	method := self readObjectAt: methodOop.
	^Context newForMethod: method"