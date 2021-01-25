remembering & forgetting
remember: anObject forSeconds: anInteger naming: nameObject 
	"remember anObject at least for anInteger seconds"
	mutex
		critical: [| names expires | 
			names _ remembered
						at: anObject
						ifAbsentPut: [Dictionary new].
			expires _ anInteger isNil
						ifFalse: [Time totalSeconds + anInteger].
			names at: nameObject put: expires]