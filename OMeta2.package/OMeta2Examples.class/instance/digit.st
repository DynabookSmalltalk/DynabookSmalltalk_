rules
digit =

	// this example shows the new syntax for super rule applications
	// think of the ^ as an arrow that's pointing up to the parent grammar

	^digit:d -> [d digitValue]