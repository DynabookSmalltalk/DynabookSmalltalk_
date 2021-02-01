geometry
bounds

	^computedBounds ifNil: [computedBounds := self computeBounds]