instance change shape
ifOutPointer: anObject thenAllObjectsDo: aBlock
	"Compatibility with NativeImageSegment (see e.g. MorphicProject class>>releaseProjectReferences:).
	 Do nothing since LegacyImageSegments are load-only. (Not sure if this is right, eem 7/3/2017 15:19)"