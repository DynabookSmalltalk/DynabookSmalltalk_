*MorphicExtras-postscript
exportAsEPSNamed: aString

	FileStream fileNamed: aString do: [:stream |
		stream nextPutAll: self asEPS]
