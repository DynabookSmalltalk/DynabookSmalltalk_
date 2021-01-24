private
httpGet: url arguments: arguments

	| progress urlString client  response result |
	progress := [ :total :amount |
		HTTPProgress new 
			total: total;
			amount: amount;
			signal: 'Downloading...' ].
	urlString := arguments
		ifNil: [ url ]
		ifNotNil: [ 
			| queryString |
			queryString := WebUtils encodeUrlEncodedForm: arguments.
			(url includes: $?)
				ifTrue: [ url, '&', queryString ]
				ifFalse: [ url, '?', queryString ] ].
	self class useSharedWebClientInstance ifTrue: [
		"Acquire webClient by atomically storing it in the client variable and setting its value to nil."
		client := webClient.
		webClient := nil ].
	client 
		ifNil: [ client := WebClient new ]
		ifNotNil: [ 
			"Attempt to avoid an error on windows by recreating the underlying stream."
			client isConnected ifFalse: [ client close ] ].
	response := client
		username: self user;
		password: self password;
		httpGet: urlString do: [ :request |
			request
				headerAt: 'Authorization' put: 'Basic ', (self user, ':', self password) base64Encoded;
				headerAt: 'Connection' put: 'Keep-Alive';
				headerAt: 'Accept' put: '*/*' ].
	result := (response code between: 200 and: 299) 
		ifFalse: [
			response content. "Make sure content is read."
			nil ]
		ifTrue: [ (RWBinaryOrTextStream with: (response contentWithProgress: progress)) reset ].
	self class useSharedWebClientInstance
		ifTrue: [
			"Save the WebClient instance for reuse, but only if there is no client cached."
			webClient  
				ifNil: [ webClient := client ]
				ifNotNil: [ client close ] ]
		ifFalse: [ client close ].
	result ifNil: [ NetworkError signal: 'Could not access ', location ].
	^result