testing
isDeprecated
	"Check for \d\d(Deprecated).* name."
	
	^ (self category findString: 'Deprecated' startingAt: 3 caseSensitive: true) > 0