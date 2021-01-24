private
httpGet: actionString for: aMCDefinition
	^ HTTPSocket
		httpGet: self locationWithTrailingSlash
		args: 
			{ 'action'->{actionString}.
			'mc-definition'-> {self serializeForRequest: aMCDefinition}}
		user: self user
		passwd: self password