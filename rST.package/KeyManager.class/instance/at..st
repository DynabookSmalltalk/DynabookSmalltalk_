accessing
at: keyObject
	"anser the object that the key was asigned before"
^ self at:keyObject ifAbsent:[self error:'Object no found for key:', keyObject asString]