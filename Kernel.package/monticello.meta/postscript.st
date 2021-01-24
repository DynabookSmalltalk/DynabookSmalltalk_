(PackageInfo named: 'Kernel') postscript: '"below, add code to be run after the loading of this package"
"Since Kernel-eem.1198 redefines LargePositiveInteger hash,
 rehash all hashed collections that contain hashed large integers."
HashedCollection allSubclassesDo:
	[:c| | f |
	f := (c includesBehavior: Set)
			ifTrue: [[:i| i]]
			ifFalse: [[:i| i keys]].
	c allInstancesDo:
		[:h|
		 ((f value: h) detect: [:e| e isInteger and: [e class ~~ SmallInteger]] ifNone: nil) ifNotNil:
			[h rehash]]]'!
