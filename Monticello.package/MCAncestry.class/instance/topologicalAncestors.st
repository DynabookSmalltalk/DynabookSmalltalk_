ancestry
topologicalAncestors
	"Answer all ancestors in topological order (that is, children always come before all their ancestors). If multiple such orderings are possible, arbitrate by time stamp."	
	^ Array streamContents:
		[:s | | frontier next |
		frontier := MCFrontier frontierOn: self.
		next := self.
		[	frontier remove: next.
			s nextPut: next.
			next := frontier frontier detectMax: [:v | v timeStamp].
			next isNil] whileFalse]