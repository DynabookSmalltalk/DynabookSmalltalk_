compiled method support
markerOrNilFor: aMethod
	"If aMethod is a marker method, answer the symbol used to mark it.  Otherwise
	 answer nil.  What is a marker method?  It is method with body like 
		'self subclassResponsibility' or '^ self subclassResponsibility' 
	 used to indicate ('mark') a special property.

	Marker methods compile to two bytecode forms, this:
		self
		send: <literal 1>
		pop
		returnSelf
	or this:
		self
		send: <literal 1>
		returnTop"
	| expectedHeaderPlusLliteralSize e byte |
	expectedHeaderPlusLliteralSize := Smalltalk wordSize * 4.
	^(((e := aMethod endPC - expectedHeaderPlusLliteralSize) = 3 or: [e = 4]) 
	  and: [aMethod numLiterals = 3
	  and: [(aMethod at: expectedHeaderPlusLliteralSize + 1) = 16r4C "push self"
	  and: [(aMethod at: expectedHeaderPlusLliteralSize + 2) = 16r80 "send"
	  and: [(byte := aMethod at: expectedHeaderPlusLliteralSize + 3) = 16rD8 "pop" or: [byte = 16r5C "returnTop"]]]]])
		ifTrue: [aMethod literalAt: 1]