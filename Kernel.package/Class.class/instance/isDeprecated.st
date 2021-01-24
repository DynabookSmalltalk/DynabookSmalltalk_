testing
isDeprecated
	"Check for \d\d(Deprecated).* name. Optimized for speed. Accept false-positives if category cache is not valid anymore. See #category."
	
	^ ((category ifNil: [self category]) findString: 'Deprecated' startingAt: 3 caseSensitive: true) > 0