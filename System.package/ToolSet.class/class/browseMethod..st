browsing
browseMethod: aCompiledMethod
	"For convenience: Either open a code browser or a version browser for the given method."
	
	^ aCompiledMethod isInstalled
		ifTrue: [self browse: aCompiledMethod methodClass selector: aCompiledMethod selector]
		ifFalse: [self browseMethodVersion: aCompiledMethod]