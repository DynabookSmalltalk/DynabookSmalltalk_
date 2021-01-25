as yet unclassified
at: anIndex count: anInteger

	SimpleCounters ifNil: [(SimpleCounters := Array new: 10) atAllPut: 0].
	SimpleCounters at: anIndex put: (SimpleCounters at: anIndex) + anInteger.