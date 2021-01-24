ancestry
hasAncestor: aVersionInfo
	"Answer whether the receiver has ancestor, aVersionInfo."
"Would it be more performant to use a Set for alreadySeen:?"
	^ self
		hasAncestor: aVersionInfo
		alreadySeen: OrderedCollection new