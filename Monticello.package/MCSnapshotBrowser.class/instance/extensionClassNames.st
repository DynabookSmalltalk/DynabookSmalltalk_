accessing
extensionClassNames
	^ (self allClassNames difference: self packageClassNames) sorted