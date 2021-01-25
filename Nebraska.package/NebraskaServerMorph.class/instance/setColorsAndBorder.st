initialization
setColorsAndBorder
	| worldColor c |
	c := ((Preferences menuColorFromWorld and: [Display depth > 4]) 
				and: [(worldColor := self currentWorld color) isColor]) 
					ifTrue: 
						[worldColor luminance > 0.7 
							ifTrue: [worldColor mixed: 0.8 with: Color black]
							ifFalse: [worldColor mixed: 0.4 with: Color white]]
					ifFalse: [Color r: 0.9 g: 0.9 b: 0.9]. 
	self color: c.
	self borderStyle: (BorderStyle raised width: 1).
	self useRoundedCorners