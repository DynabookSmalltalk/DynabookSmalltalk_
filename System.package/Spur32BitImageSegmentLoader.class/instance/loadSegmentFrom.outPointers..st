loading
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	"Override to initialize rangeMappings if loading a 32-bit segment into a 64-bit system"

	| result |
	Smalltalk wordSize = 8 ifTrue:
		[rangeMappings := OrderedCollection new].
	result := super loadSegmentFrom: segmentWordArray outPointers: outPointerArray.
	self maybeMapRanges.
	^result