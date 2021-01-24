private
displayProgress: label during: workBlock
	| nextUpdateTime |
	nextUpdateTime := 0.
	^label displayProgressFrom: 0.0 to: 1.0 during:[:bar|
		bar value: 0.0.
		workBlock on: HTTPProgress do:[:ex|
			(ex total == nil or:[ex amount == nil]) ifFalse:[
				(nextUpdateTime < Time millisecondClockValue 
					or:[ex total = ex amount]) ifTrue:[
						bar value: ex amount asFloat / ex total asFloat.
						nextUpdateTime := Time millisecondClockValue + 100.
				].
			].
			ex resume.
		]
	].
