private
releaseVersion: aVersion url: urlString
	| result |
	result := HTTPSocket
		httpPost: self squeakMapUrl, '/packagebyname/', packageName, '/newrelease'
		args: {'version' -> {(aVersion info versionNumber)}.
			   'note' -> {aVersion info message}.
			   'downloadURL' -> {urlString}}
		user: user
		passwd: password.
	result contents size > 4 ifTrue: [self error: result contents]
