literals
allLiterals
	"Skip compiled-code objects. Keep literal arrays, bindings, etc."
	
	^ Array streamContents: [:result |
		self allLiteralsDo: [:literal | result nextPut: literal]]