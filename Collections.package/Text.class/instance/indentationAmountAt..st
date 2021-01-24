attributes
indentationAmountAt: anInterval 
	anInterval do:
		[ : position | self
			attributesAt: position
			do: [ : attr | attr isTextIndent ifTrue: [ ^ attr amount ] ] ].
	^ 0