private
maybeMapRanges
	"If loading a 32-bit segment into a 64-bit segment then map LargePositiveIntegers or BoxedFloat64
	 instances that can be expressed as SmallInteger or SmallFloat64 immediates respectively.
	 Implement as a bulk become for speed."

	| ins outs |
	rangeMappings ifNil: [^self].
	ins := WriteStream on: (Array new: rangeMappings size).
	outs := WriteStream on: (Array new: rangeMappings size).
	rangeMappings do:
		[:numeric| | mapping |
		(numeric isInteger
			ifTrue:
				[mapping := numeric normalize.
				 mapping ~~ numeric]
			ifFalse:
				[mapping := numeric * 1.0.
				 mapping class ~~ numeric class]) ifTrue:
			[ins nextPut: numeric.
			 outs nextPut: mapping]].
	ins position > 0 ifTrue:
		[ins contents elementsForwardIdentityTo: outs contents copyHash: false]