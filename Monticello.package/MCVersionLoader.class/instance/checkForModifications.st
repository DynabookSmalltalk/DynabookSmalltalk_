checking
checkForModifications
	| modifications |
	modifications := versions select: [:ea | ea package workingCopy modified].
	modifications isEmpty ifFalse: [self warnAboutLosingChangesTo: modifications].