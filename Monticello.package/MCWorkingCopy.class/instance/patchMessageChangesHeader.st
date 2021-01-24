operations
patchMessageChangesHeader
	^ancestry summary, String cr,
	'Added, Modified, Deleted',
	(self ancestors ifEmpty: [''] ifNotEmpty: [' vs. ', self ancestors first name]), ':'