fileOut
printSpaceAnalysis: threshold onStream: stream
	"If threshold > 0, then only those classes with more than that number
	of instances will be shown, and they will be sorted by total instance space.
	If threshold = 0, then all classes will appear, sorted by name."

	| totalCodeSpace totalInstCount totalInstSpace totalPercent classNameLength printRow |
	self systemWideSpaceTally.
	totalCodeSpace := totalInstCount := totalInstSpace := 0.
	classNameLength := 1.
	results do: [ :each |
		classNameLength := classNameLength max: each analyzedClassName size.
		totalCodeSpace := totalCodeSpace + each codeSize.
		totalInstCount := totalInstCount + each instanceCount.
		totalInstSpace := totalInstSpace + each spaceForInstances ].
	totalPercent := 0.0.

	printRow := [ :class :codeSpace :instanceCount :instanceSpace :percent |
		stream
			nextPutAll: (class padded: #right to: classNameLength + 1 with: $ );
			nextPutAll: (codeSpace padded: #left to: 12 with: $ );
			nextPutAll: (instanceCount padded: #left to: 12 with: $ );
			nextPutAll: (instanceSpace padded: #left to: 14 with: $ );
			nextPutAll: (percent padded: #left to: 8 with: $ );
			cr ].

	stream timeStamp.
	printRow valueWithArguments: { 'Class'. 'code space'. '# instances'. 'inst space'. 'percent' }.

	threshold > 0
		ifTrue: "If inst count threshold > 0, then sort by space"
			[results := results select: [ :s |
										s instanceCount >= threshold
										or: [s spaceForInstances > (totalInstSpace // 500) ] ].
			 results sort: [ :s :s2 |
						  s spaceForInstances > s2 spaceForInstances
						  or: [s spaceForInstances = s2 spaceForInstances
							  and: [s analyzedClassName < s2 analyzedClassName] ] ] ]
		ifFalse: "Otherwise sort by name"
			[results sort: [ :s :s2 | s analyzedClassName < s2 analyzedClassName]].

	results do: [ :s |
		| percent | 
		percent := s spaceForInstances * 100.0 / totalInstSpace.
		totalPercent := totalPercent + percent.
		printRow valueWithArguments: {
			s analyzedClassName.
			s codeSize printString.
			s instanceCount printString.
			s spaceForInstances asBytesDescription.
			percent printShowingDecimalPlaces: 1 } ].

	stream cr.
	printRow valueWithArguments: {
		'Total'.
		totalCodeSpace printString.
		totalInstCount printString.
		totalInstSpace printString.
		totalPercent printShowingDecimalPlaces: 1 }