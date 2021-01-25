*nebraska-Morphic-Remote
encodeForRemoteCanvas

	| encoded |

	CanvasEncoder at: 4 count:  1.
	(encoded := String new: 12)
		putInteger32: (rgb bitAnd: 16rFFFF) at: 1;
		putInteger32: (rgb >> 16) at: 5;
		putInteger32: self privateAlpha at: 9.
	^encoded