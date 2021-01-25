printing
treePrintOn: aStream tabs: tabs thisTab: myTab total: total totalTime: totalTime tallyExact: isExact orThreshold: threshold 
	| children |
	tabs do: [:tab | aStream nextPutAll: tab].
	tabs size > 0 
		ifTrue: 
			[self 
				printOn: aStream
				total: total
				totalTime: totalTime
				tallyExact: isExact].
	children := isExact ifTrue: [receivers] ifFalse: [self childrenOver: threshold].
	children isEmpty 
		ifFalse: 
			[tabs addLast: myTab.
			children sort.
			1 to: children size do: [ :i | 
				| childTab |
				childTab := i < children size ifTrue: ['  |'] ifFalse: ['  '].
				(children at: i) 
					treePrintOn: aStream
					tabs: (tabs size < self maxTabs 
							ifTrue: [tabs]
							ifFalse: [(tabs select: [:x | x = '[']) copyWith: '['])
					thisTab: childTab
					total: total
					totalTime: totalTime
					tallyExact: isExact
					orThreshold: threshold].
			tabs removeLast]