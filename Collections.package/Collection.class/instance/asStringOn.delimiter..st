printing - obsolete
asStringOn: aStream delimiter: delimString

	self flag: #deprecate.
	^ self asArray joinOn: aStream separatedBy: delimString