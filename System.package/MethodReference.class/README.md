A MethodReference is is a lightweight proxy for a CompiledMethod.  Has methods to refer to the CompileMethod's source statements, byte codes. Is heavily used by Tools.

Instance Variables
	classIsMeta:		Boolean class vs. instance
	classSymbol:		Symbol for method's class (without class keyword if meta)
	methodSymbol:	Symbol for method's selector
	stringVersion:		'Class>>selector:' format

