accessing
default
	(default isNil or: [ default directory exists not ]) ifTrue: [ default := self new directory: self cacheDirectory ].
	^ default