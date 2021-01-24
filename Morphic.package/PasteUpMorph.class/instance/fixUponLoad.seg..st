objects from disk
fixUponLoad: aProject seg: anImageSegment 
	"We are in an old project that is being loaded from disk.
	Fix up conventions that have changed."
	| weakMessage |
	self isWorldMorph
		ifTrue: [(self valueOfProperty: #soundAdditions)
				ifNotNil: [:additions | SampledSound assimilateSoundsFrom: additions]].
	self actionMap
		ifNotNil: [:aDictionary | 
			weakMessage := aDictionary
						at: #aboutToLeaveWorld
						ifAbsent: [].
			weakMessage
				ifNotNil: [weakMessage selector = #removeModalWindow
						ifTrue: [weakMessage receiver: nil]]].
	^ super fixUponLoad: aProject seg: anImageSegment