editing keys
changeEmphasis: characterStream
	"Change emphasis without styling if necessary"
	self styler ifNil: [^super changeEmphasis: characterStream].
	^ self styler evaluateWithoutStyling: [super changeEmphasis: characterStream].