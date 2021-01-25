as yet unclassified
openIn: aWorld

	"open an a chat window"

	aWorld ifNil: [^self].
	self 
		position: 400@100;
		extent:  200@150;
		openInWorld: aWorld.