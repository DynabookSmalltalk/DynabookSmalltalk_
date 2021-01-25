private
lineHeightForMorphOfHeight: aMorphHeight aligned: morphPosition to: linePosition paddedWith: verticalPadding andOptionalMorphBaseline: morphBaseline
	"The idea here is to first compute the total height and then subtract the overlapping area."

	| adjustedLineHeight morphHeight total |
	morphHeight := aMorphHeight + verticalPadding.
	total := font height + morphHeight.
	adjustedLineHeight := 0.
	
	morphPosition = #top 		ifTrue: [
			linePosition = #top			ifTrue: [adjustedLineHeight := total - font height].
			linePosition = #center 		ifTrue: [adjustedLineHeight := total - (font descent + (font ascent / 2))].
			linePosition = #baseline 	ifTrue: [adjustedLineHeight := total - font descent].
			linePosition = #bottom 		ifTrue: [adjustedLineHeight := total].].
	morphPosition = #center 	ifTrue: [ | upperMorphHalf lowerMorphHalf |
			"The overlapping area of a morph aligned at the center position can be determined by splitting 
			the morph into a top half which is aligned at the bottom and a lower half aligned at the top."
			upperMorphHalf := self 
				lineHeightForMorphOfHeight: aMorphHeight // 2 
				aligned: #bottom to: linePosition. 
			lowerMorphHalf := self 
				lineHeightForMorphOfHeight: aMorphHeight // 2
				aligned: #top to: linePosition.
			adjustedLineHeight := upperMorphHalf + lowerMorphHalf - font height].
	morphPosition = #baseline ifTrue: [ | upperMorphHalf lowerMorphHalf |
			"We use the same trick as we used with the center position but with different proportions of the morph."
			upperMorphHalf := self 
				lineHeightForMorphOfHeight: morphBaseline 
				aligned: #bottom to: linePosition. 
			lowerMorphHalf := self 
				lineHeightForMorphOfHeight: aMorphHeight - morphBaseline 
				aligned: #top to: linePosition.
			adjustedLineHeight := upperMorphHalf + lowerMorphHalf - font height].
	morphPosition = #bottom 	ifTrue: [
			linePosition = #top			ifTrue: [adjustedLineHeight := total].
			linePosition = #center 		ifTrue: [adjustedLineHeight := total - (font ascent / 2)].
			linePosition = #baseline 	ifTrue: [adjustedLineHeight := total - font ascent].
			linePosition = #bottom 		ifTrue: [adjustedLineHeight := total - font height].].

	^ adjustedLineHeight