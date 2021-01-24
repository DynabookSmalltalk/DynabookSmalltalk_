instance creation
scanTokens: aString
	"compatibility"
	^{ self scan: aString readStream }