accessing
page: aMorph

	page := aMorph.
	self computeThumbnail.
	self setNameTo: aMorph externalName.
	page fullReleaseCachedState.
