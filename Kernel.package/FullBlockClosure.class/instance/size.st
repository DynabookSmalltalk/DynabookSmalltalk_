accessing
size
	"Answer closure's bytecode size (number of bytes) by accessing
	 the closure's method."
	^self compiledBlock endPC - self compiledBlock initialPC + 1