other
forceToScreen: rect

	mirrorOfScreen ifNil: [
		mirrorOfScreen := (previousVersion ifNil: [Display]) deepCopy.
	].
	mirrorOfScreen copy: rect from: rect origin in: Display rule: Form over.
	dirtyRect := dirtyRect ifNil: [rect] ifNotNil: [dirtyRect merge: rect].
