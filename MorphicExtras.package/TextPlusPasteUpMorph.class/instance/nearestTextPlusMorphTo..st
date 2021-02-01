private
nearestTextPlusMorphTo: aMorph

	^self allTextPlusMorphs inject: nil into: [ :best :each |
		self select: best or: each asClosestTo: aMorph
	]