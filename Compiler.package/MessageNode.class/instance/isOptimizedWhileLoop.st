testing
isOptimizedWhileLoop
	^special > 0
	   and: [#(transformWhile: transformRepeat:) includes: (MacroTransformers at: special)]