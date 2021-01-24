private
isIndexed
	^ indexed ifNil:
		[indexed := [(HTTPSocket
			httpGet: self locationWithTrailingSlash
			args: {'query' -> {'isHistorySupported'}}
			user: self user
			passwd: self password) contents = 'true']
			on: Error
			do:
				[:err | false]]