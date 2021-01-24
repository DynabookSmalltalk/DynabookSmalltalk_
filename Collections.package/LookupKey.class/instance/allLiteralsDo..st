literals
allLiteralsDo: aBlock
	"Treat myself or my key as literal. Do not treat any value (i.e., in Association or Binding) as literal to avoid decending too thoroughly. As a consequence, for example, classes have to be resolved to their class bindings or class names before using them as input in this interface."
	
	aBlock value: self.	
	self key allLiteralsDo: aBlock.