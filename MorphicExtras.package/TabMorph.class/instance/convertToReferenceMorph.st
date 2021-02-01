converting
convertToReferenceMorph
	| aMorph |
	aMorph := ReferenceMorph new referent: morphToInstall.
	aMorph position: self position.
	self becomeForward: aMorph.