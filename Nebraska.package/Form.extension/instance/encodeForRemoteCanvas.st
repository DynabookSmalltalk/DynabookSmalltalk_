*nebraska-encoding
encodeForRemoteCanvas
	| header binaryForm |
	"encode into a bitstream for use with RemoteCanvas.  The format does not require invoking the Compiler"
	header := String streamContents: [ :str |
	str "nextPutAll: 'F|';"
		nextPutAll: self depth printString;
		nextPut: $,;
		nextPutAll: self width printString;
		nextPut: $,;
		nextPutAll: self height printString;
		nextPut: $|. ].

	binaryForm := ByteArray streamContents: [ :str |
		self unhibernate.
		bits writeOn: str. ].

	^header, binaryForm asString
