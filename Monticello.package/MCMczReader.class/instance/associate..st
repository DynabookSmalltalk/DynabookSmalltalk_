utilities
associate: tokens
	| result |
	result := Dictionary new.
	tokens pairsDo: [:key :value | 
					result at: key put: (value isString
						ifTrue: [value]
						ifFalse: [value collect: [:ea | self associate: ea]])].
	^ result