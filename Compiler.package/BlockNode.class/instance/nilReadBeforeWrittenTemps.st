closure analysis
nilReadBeforeWrittenTemps
	| visitor readBeforeWritten |
	temporaries isEmpty ifTrue:
		[^self].
	self accept: (visitor := OptimizedBlockLocalTempReadBeforeWrittenVisitor new).
	readBeforeWritten := visitor readBeforeWritten.
	temporaries reverseDo:
		[:temp|
		((readBeforeWritten includes: temp)
		 and: [temp isRemote not]) ifTrue:
			[statements addFirst: (AssignmentNode new variable: temp value: NodeNil)]]