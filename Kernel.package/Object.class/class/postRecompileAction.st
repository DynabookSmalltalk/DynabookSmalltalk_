documentation
postRecompileAction
	"This is a stub method to document the convention for reinitializing state at the end of Compiler recompileAll.
	 The issue is that after recompiling all methods, processes or blocks could remain that refer to old methods,
	 and that somehow those processes should be restarted and objects referring to blocks rebuilt.  For example,
	 PluggableDictionary integerDictionary creates a PluggableDictionary with a hashBlock that refers to the
	 PluggableDictionary class>>#integerDictionary method.  Users of PluggableDictionary integerDictionary can
	 rebuild structures containing it after recompile by implementing thsi method to do so.  Compiler will then
	 invoke any and all such methods after recompileAll."

	^self