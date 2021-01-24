entropy source
gatherEntropyInto: aByteArray
	"Gather good random entropy from a system source and fill up aByteArray with it. Return true upon success, else false."
	
	<primitive: 'primitiveGatherEntropy' module: 'CroquetPlugin'>
	^false