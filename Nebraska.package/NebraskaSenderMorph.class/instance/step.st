stepping and presenter
step

	(self valueOfProperty: #currentBadgeVersion) = self currentBadgeVersion ifFalse: [
		self setProperty: #currentBadgeVersion toValue: self currentBadgeVersion.
		self fixOldVersion.
		Preferences defaultAuthorName.		"seems like a good place to insure we have a name"
	].
	super step.