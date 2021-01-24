layout-properties
hResizing: aSymbol

	super hResizing: aSymbol.
	
	aSymbol == #shrinkWrap
		ifTrue: [self autoFit: true; wrapFlag: false];
		ifFalse: ["#rigid or #spaceFill -- Prefer to not cut out text."
			self autoFit: self vResizing == #shrinkWrap; wrapFlag: true].

	self releaseParagraph.