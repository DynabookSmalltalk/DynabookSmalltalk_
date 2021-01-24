actions
flushCachedVersionsAncestry
	| beforeBytes afterBytes beforeVersions afterVersions beforeInfos afterInfos |
	Cursor wait showWhile: 
		[ beforeBytes := Smalltalk garbageCollect.
		beforeVersions := MCVersion allSubInstances size.
		beforeInfos := MCVersionInfo instanceCount.
		MCFileBasedRepository flushAllCaches.
		MCWorkingCopy stubAllAncestry.
		afterBytes := Smalltalk garbageCollect.
		afterVersions := MCVersion allSubInstances size.
		afterInfos := MCVersionInfo instanceCount ].
	self inform: 
		(beforeVersions-afterVersions) asString, ' versions flushed',
		String cr, (beforeInfos-afterInfos), ' infos flushed',
	 	String cr, (afterBytes-beforeBytes) asBytesDescription, ' reclaimed'