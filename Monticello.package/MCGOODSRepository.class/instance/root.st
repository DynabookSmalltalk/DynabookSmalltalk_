accessing
root
	self db root ifNil: [self db root: Dictionary new].
	^ self db root