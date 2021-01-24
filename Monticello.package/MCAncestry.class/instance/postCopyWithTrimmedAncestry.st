copying
postCopyWithTrimmedAncestry
	ancestors ifNotNil:
		[ ancestors := ancestors collect:
			[ : each | each copy
				 clearAncestors ;
				 clearStepChildren ;
				 yourself ] ].
	stepChildren ifNotNil:
		[ stepChildren := stepChildren collect:
			[ : each | each copy
				 clearAncestors ;
				 clearStepChildren ;
				 yourself ] ]