code generation
generate: trailer using: aCompiledMethodClass
	"The receiver is the root of a parse tree. Answer an instance of aCompiledMethodClass.
	 The argument, trailer, is arbitrary but is typically either the reference to the source code
	 that is stored with every CompiledMethod, or an encoding of the method's temporary names."

	| method |
	self generate: trailer
		using: aCompiledMethodClass
		ifQuick:
			[:m |
			  m	literalAt: 2 put: encoder associationForClass;
				properties: properties.
			^m].
	method := encoder generateMethodOfClass: aCompiledMethodClass trailer: trailer from: self.
	method properties: properties.
	^method