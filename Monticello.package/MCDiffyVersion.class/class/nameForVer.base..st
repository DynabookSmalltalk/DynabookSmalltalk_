name utilities
nameForVer: versionName base: baseName
	| baseId |
	baseId := versionName packageName = baseName packageName
		ifFalse: [ '@' , baseName ] 
		ifTrue: [
			versionName author = baseName author
				ifTrue: [ baseName versionNumber asString ]
				ifFalse: [ baseName author, '.', baseName versionNumber asString ] ].
	^ versionName versionName , '(' , baseId , ')'