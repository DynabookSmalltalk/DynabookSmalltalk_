morphic ui
version
	^ version ifNil:
		[Cursor wait showWhile:
			[version := repository versionNamed: selectedVersion].
		version]