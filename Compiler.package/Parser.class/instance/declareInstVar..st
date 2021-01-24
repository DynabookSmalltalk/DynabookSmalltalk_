error correction
declareInstVar: name
	"Declare an instance variable.  Since the variable will get added after any existing
	 inst vars its index is the instSize."
	encoder classEncoding addInstVarName: name.
	Smalltalk logChange: encoder classEncoding definition.
	^InstanceVariableNode new name: name index: encoder classEncoding instSize
		