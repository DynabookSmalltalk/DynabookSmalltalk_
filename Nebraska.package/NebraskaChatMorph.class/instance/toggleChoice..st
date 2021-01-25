as yet unclassified
toggleChoice: aSymbol
	
	aSymbol == #acceptOnCR ifTrue: [
		acceptOnCR := (acceptOnCR ifNil: [true]) not.
		sendingPane ifNotNil: [sendingPane acceptOnCR: acceptOnCR].
		^self
	].

