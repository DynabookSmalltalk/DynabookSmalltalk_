public
verify: signatureString isSignatureOf: aStringOrStream publicKey: publicKey
	"Answer true if the given signature string signs the given message (a stream or string)."
	"Note: Random numbers are not needed for signature verification; thus, there is no need to call initRandomFromUser before verifying a signature."

	| dsa hasher h sig |
	dsa := DigitalSignatureAlgorithm new.
	hasher := SecureHashAlgorithm new.
	(aStringOrStream class isBytes)
		ifTrue: [h := hasher hashMessage: aStringOrStream]
		ifFalse: [h := hasher hashStream: aStringOrStream].
	sig := dsa stringToSignature: signatureString.
	^ dsa verifySignature: sig ofMessageHash: h publicKey: publicKey
