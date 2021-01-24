sorting
mergeSortFrom: firstIndex to: lastIndex into: destination by: aBlock
	"Private. Split the range to be sorted in half, sort each half, and 
	merge the two half-ranges into destination."

	| n firstObject lastObject |
	"Precondition: firstIndex <= lastIndex, self and destination contain the same elements between firstIndex and lastIndex inclusively but not necessarily in the same order"
	(n := lastIndex - firstIndex) <= 1 ifTrue: [ "Handle 1 and 2 sized ranges directly."
		n = 0 ifTrue: [ ^self ].
		firstObject := self at: firstIndex.
		lastObject := self at: lastIndex.
		(aBlock
			ifNil: [ firstObject <= lastObject ]
			ifNotNil: [ aBlock value: firstObject value: lastObject ])
			ifFalse: [
				destination
					at: lastIndex put: firstObject;
					at: firstIndex put: lastObject ]
			ifTrue: [
				destination
					at: lastIndex put: lastObject;
					at: firstIndex put: firstObject ].
		^self ].
	n := firstIndex + lastIndex // 2.
	destination mergeSortFrom: firstIndex to: n into: self by: aBlock.
	destination mergeSortFrom: n + 1 to: lastIndex into: self by: aBlock.
	self mergeFirst: firstIndex middle: n last: lastIndex into: destination by: aBlock