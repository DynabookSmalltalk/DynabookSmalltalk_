testing
isValid
	^ [ (self endsWith: '.mcm') or:
		[ self packageName notEmpty and:
			[ self author notEmpty and: [ self versionNumber > 0 ] ] ] ]
		on: Error
		do:
			[ : err | false ]