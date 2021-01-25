methods
sourceCodeAt: sel ifAbsent: block
	^ self sourceCode
		at: sel
		ifPresent: [:src | src string]
		ifAbsent: block