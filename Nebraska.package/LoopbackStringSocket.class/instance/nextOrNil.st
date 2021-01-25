I/O
nextOrNil

	inArrays ifNil: [^nil].

	inArrays isEmpty 
		ifTrue: [ ^nil ]
		ifFalse: [
			^inArrays removeFirst. ]	