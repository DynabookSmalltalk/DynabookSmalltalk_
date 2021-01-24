versions
versionNamesForPackageNamed: aString 
	^ Array streamContents:
		[ : stream | self root keysDo:
			[ : each | each versionName packageName = aString ifTrue: [ stream nextPut: each ] ] ]