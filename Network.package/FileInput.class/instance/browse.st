accessing
browse
	| fileName |
	fileName := (FileChooserDialog openOn: self directory) ifNil: [^nil].

	textMorph setText: fileName;
		hasUnacceptedEdits: true;
		accept