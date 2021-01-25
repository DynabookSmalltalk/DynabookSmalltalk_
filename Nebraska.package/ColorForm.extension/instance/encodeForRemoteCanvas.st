*nebraska-Morphic-Remote
encodeForRemoteCanvas

	"encode into a bitstream for use with RemoteCanvas."

	| colorsToSend |

	colorsToSend := self colors.
	^String streamContents: [ :str |
		str
			nextPut: $C;		"indicates color form"
			nextPutAll: colorsToSend size printString;
			nextPut: $,.
		colorsToSend do: [ :each |
			str nextPutAll: each encodeForRemoteCanvas
		].
		str nextPutAll: super encodeForRemoteCanvas
	].

