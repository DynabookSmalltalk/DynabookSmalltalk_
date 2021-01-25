*nebraska-Morphic-Remote
encodeForRemoteCanvasB

	| encoded |

	encoded := Bitmap new: 4.
	encoded at: 1 put: origin x asInteger.
	encoded at: 2 put: origin y asInteger.
	encoded at: 3 put: corner x asInteger.
	encoded at: 4 put: corner y asInteger.

	^encoded