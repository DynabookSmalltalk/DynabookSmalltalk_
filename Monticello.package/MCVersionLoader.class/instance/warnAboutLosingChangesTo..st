checking
warnAboutLosingChangesTo: versionCollection
	self notify: (String streamContents: [:s |
		s nextPutAll: 'You are about to load new versions of the following packages that have unsaved changes in the image.  If you continue, you will lose these changes.'; cr.
		versionCollection do:
			[:ea |
			s cr; space; space; nextPutAll: ea package name]])