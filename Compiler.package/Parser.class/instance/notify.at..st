error handling
notify: string at: location 
	| messageText |
	messageText := '"' , string , ' ->"'.
	cue requestor isNil
		ifTrue: [
			| notification |
			(encoder == self or: [encoder isNil])
				ifTrue: [^ self fail "failure setting up syntax error"].
			(notification := SyntaxErrorNotification
				inClass: encoder classEncoding
				withCode: (source contents asText
					copyReplaceFrom: location
					to: location - 1
					with: messageText)
				doitFlag: doitFlag
				errorMessage: string
				location: location) signal.
			notification tryNewSourceIfAvailable]
		ifFalse: [cue requestor
			notify: messageText
			at: location
			in: source].
	^ self fail