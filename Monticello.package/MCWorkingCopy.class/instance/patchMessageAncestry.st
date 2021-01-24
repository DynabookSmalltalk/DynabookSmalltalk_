operations
patchMessageAncestry
	^ String streamContents: [:strm |
		strm nextPutAll:	ancestry summary; cr.
		self ancestors do: [:ancestor |
			strm cr.
			strm nextPutAll: ancestor name; nextPut: $:; crtab.
			strm nextPutAll: ancestor message; cr.]]
