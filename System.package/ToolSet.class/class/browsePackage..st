browsing
browsePackage: aPackageInfo

	self default ifNil: [^ self inform: 'Cannot open Browser'].
	^ self default browsePackage: aPackageInfo