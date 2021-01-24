convenience
forEncoding: encodingString
	"Answer a converter class for the given encoding"
	encodingString ifNil: [^ NullMimeConverter].
	^ encodingString asLowercase caseOf: 
		{ ['base64'] -> [Base64MimeConverter].
		   ['quoted-printable'] -> [QuotedPrintableMimeConverter].
		   ['7bit'] -> [Bit7MimeConverter].
		   ['8bit'] -> [NullMimeConverter].
		   ['binary'] -> [NullMimeConverter] }
		otherwise: [NullMimeConverter].
