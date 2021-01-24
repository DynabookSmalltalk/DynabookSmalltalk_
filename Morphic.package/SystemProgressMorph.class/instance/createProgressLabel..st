private
createProgressLabel: aString
	
	^ (StringMorph contents: aString font: self font)
		color: self textColor;
		yourself