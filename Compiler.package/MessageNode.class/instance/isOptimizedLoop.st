testing
isOptimizedLoop
	^special > 0
	   and: [#(transformWhile: transformToDo: transformRepeat:) includes: (MacroTransformers at: special)]