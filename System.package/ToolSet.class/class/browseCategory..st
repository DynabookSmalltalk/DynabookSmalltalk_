browsing
browseCategory: aCategory

	self default ifNil: [^ self inform: 'Cannot open Browser'].
	^ self default browseCategory: aCategory