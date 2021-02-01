boxes
genericBoxArea: countDownFromTop

	^self innerBounds right @ (self top + (countDownFromTop * 2 * self borderWidth)) 
		extent: self borderWidth asPoint
