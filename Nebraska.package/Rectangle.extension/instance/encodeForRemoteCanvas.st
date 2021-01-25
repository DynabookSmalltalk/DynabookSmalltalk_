*nebraska-Morphic-Remote
encodeForRemoteCanvas

	| encoded |

	CanvasEncoder at: 2 count:  1.
	encoded := String new: 16.
	encoded putInteger32: origin x asInteger at: 1.
	encoded putInteger32: origin y asInteger at: 5.
	encoded putInteger32: corner x asInteger at: 9.
	encoded putInteger32: corner y asInteger at: 13.

	^encoded