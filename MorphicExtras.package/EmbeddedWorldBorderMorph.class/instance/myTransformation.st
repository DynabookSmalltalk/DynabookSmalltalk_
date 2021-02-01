accessing
myTransformation

	^submorphs detect: [ :x | x isKindOf: TransformationMorph] ifNone: [nil]
