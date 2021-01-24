accessing
versionName
	^ name
		ifNil: [ self name ]
		ifNotNil: [ name asMCVersionName ]