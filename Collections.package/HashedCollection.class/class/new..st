instance creation
new: numberOfElements
	"Create a HashedCollection large enough to hold numberOfElements different objects without growing."
	
	^self basicNew initialize: (numberOfElements <= 3
		ifFalse: [ self sizeFor: numberOfElements ]
		ifTrue: [ "Inline values returned by #sizeFor: to ensure that #new: is not significantly slower than #new for small values."
			numberOfElements < 3
				ifTrue: [ 3 ]
				ifFalse: [ 5 ] ])