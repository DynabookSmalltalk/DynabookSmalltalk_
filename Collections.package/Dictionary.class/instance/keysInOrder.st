accessing
keysInOrder
	"Answer the keys of the receiver in a particular sequence.  This default is alphabetical, but subclasses like OrderedDictionary maintain their own sequence."
	^ self keysSortedSafely