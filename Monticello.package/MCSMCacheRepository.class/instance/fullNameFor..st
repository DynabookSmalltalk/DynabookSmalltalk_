accessing
fullNameFor: aFileName
	^self allFullFileNames detect: [ :ffn | (self directory localNameFor: ffn) = aFileName ] ifNone: []