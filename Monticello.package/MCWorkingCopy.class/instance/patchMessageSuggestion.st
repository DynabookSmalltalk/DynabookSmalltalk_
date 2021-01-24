operations
patchMessageSuggestion
	^ String streamContents: [:strm | strm
		nextPutAll: self patchMessageDefault; cr;cr;
		nextPutAll: self patchMessageChangesDelimiter; cr;
		nextPutAll: self patchMessageAncestry; cr; cr;
		nextPutAll: self patchMessageChanges]