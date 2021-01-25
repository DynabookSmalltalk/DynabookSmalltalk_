private
primCompareColor: colorValueA to: colorValueB test: testID
	"Call the prim that compares pixel color values and can tell if two Forms that overlap in some manner when composited are touching colors as defined by the testID.
"
	<primitive: 'primitiveCompareColors' module: 'BitBltPlugin'>
	"to signal failure without an error we'll return -1"
	^-1