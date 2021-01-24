scanning
scanBlockOrNilForLiteral: aLiteral
	"Answer a block argument for CompiledMethod>>#scanFor: that answers
	 if the method refers to the literal implicitly via a special bytecode.
	 If the literal is not accessible via a special bytecode, answer nil.
	 Subclasses override as appropriate"
	^nil