repository-api
description
	^ String streamContents:
		[ : stream | stream nextPutAll: '{ '.
		repositories
			do: [ : each | stream nextPut: $';  nextPutAll: each description; nextPut: $' ]
			separatedBy: [ stream nextPutAll: '. ' ].
		stream nextPutAll: ' }' ]