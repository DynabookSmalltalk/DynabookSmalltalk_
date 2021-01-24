repository-api
versionWithInfo: aVersionInfo ifAbsent: aBlock 
	self repositories do:
		[ : each | ([each
			versionWithInfo: aVersionInfo
			ifAbsent: [ nil ]] on: NetworkError do: [ : err | nil ]) ifNotNil:
			[ : ver | ^ ver ] ].
	^ aBlock value