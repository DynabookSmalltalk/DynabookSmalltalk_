progeny
lastMergeOf: aNode and: anotherNode
	"Find the last merge of two Nodes starting from myself.
	Answer nil if there is none.
	Note: there might have been several merges, in which case we take the common merge of merges.
	Example: if c is a merge of a and b, d is also a merge of a and b, and e is a merge of c and d, then asnwer e."

	| common |
	(self hasAncestor: aNode) ifFalse: [^nil].
	(self hasAncestor: anotherNode) ifFalse: [^nil].
	common := ancestors collect: [:e | e lastMergeOf: aNode and: anotherNode] as: Set.
	common remove: nil ifAbsent: [].
	common size = 1 ifTrue: [^common anyOne].
	^self
	