*nebraska-Morphic-Remote
encodeForRemoteCanvas

	| encoded |

	CanvasEncoder at: 3 count:  1.
	encoded := String new: 8.
	encoded putInteger32: x asInteger at: 1.
	encoded putInteger32: y asInteger at: 5.
	^encoded