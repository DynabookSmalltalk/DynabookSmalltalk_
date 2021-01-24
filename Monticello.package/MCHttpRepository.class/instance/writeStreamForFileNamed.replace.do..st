private
writeStreamForFileNamed: aString replace: ignoreBoolean do: aBlock
	| stream response statusLine code |
	stream := RWBinaryOrTextStream on: String new.
	aBlock value: stream.
	self displayProgress: 'Uploading ', aString during:[
		response := HTTPSocket
					httpPut: stream contents
					to: (self urlForFileNamed: aString)
					user: self user
					passwd: self password.
	].
	"More robust handling of HTTP responses. Instead of enumerating
	all possible return codes and http versions, do a quick parse"
	(response beginsWith: 'HTTP/') ifTrue:[
		"Looks like an HTTP header, not some error message"
		statusLine := response copyUpTo: Character cr.
		code := [(statusLine findTokens: ' ') second asInteger] on: Error do:[].
	].
	(code isInteger and:[code between: 200 and: 299]) 
		ifFalse:[self error: response].