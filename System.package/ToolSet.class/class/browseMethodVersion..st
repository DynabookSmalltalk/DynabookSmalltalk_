browsing
browseMethodVersion: aCompiledMethod
	
	self default ifNil:[^self inform: 'Cannot open Browser'].
	^self default browseMethodVersion: aCompiledMethod