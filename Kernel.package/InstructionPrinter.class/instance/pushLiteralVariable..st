instruction decoding
pushLiteralVariable: anAssociation
	"Print the Push Value Of anAssociation On Top Of Stack bytecode."

	self print: 'pushLitVar: ' , (anAssociation printStringLimitedTo: 64)