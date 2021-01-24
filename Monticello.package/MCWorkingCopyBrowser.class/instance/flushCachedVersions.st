actions
flushCachedVersions
	| beforeBytes afterBytes beforeVersions afterVersions |
	Cursor wait showWhile: [
		Smalltalk garbageCollect.
		beforeBytes := Smalltalk bytesLeft: true.
		beforeVersions := MCVersion allSubInstances size.
		MCFileBasedRepository flushAllCaches.
		afterBytes := Smalltalk bytesLeft: true.
		afterVersions := MCVersion allSubInstances size.
	].
	^self inform: (beforeVersions - afterVersions) asString, ' versions flushed', String cr,
 		(beforeBytes - afterBytes) asBytesDescription, ' bytes reclaimed'