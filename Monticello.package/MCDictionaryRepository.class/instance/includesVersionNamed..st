versions
includesVersionNamed: aString 
	| mcVersionName |
	mcVersionName := aString asMCVersionName.
	^ dict anySatisfy:
		[ : ea | ea info versionName = mcVersionName ]