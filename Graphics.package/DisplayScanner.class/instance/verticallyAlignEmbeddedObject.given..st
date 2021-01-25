private
verticallyAlignEmbeddedObject: aMorphOrForm given: textAnchorProperties

	| alignedPositionY positionInLine morphPosition padding morphBaselineGetter |
	alignedPositionY := lineY + line baseline.
	positionInLine := textAnchorProperties verticalAlignmentLine.
	positionInLine = #top 		ifTrue: 	[alignedPositionY := alignedPositionY - font ascent].
	positionInLine = #center 	ifTrue: 	[alignedPositionY := (alignedPositionY - (font ascent / 2)) floor].
	positionInLine = #bottom	ifTrue: 	[alignedPositionY := alignedPositionY + font descent].
	"#baseline does not require adjustments"
	
	padding := textAnchorProperties padding.
	morphBaselineGetter := textAnchorProperties morphBaselineGetter.
	morphPosition := textAnchorProperties verticalAlignmentMorph.
	morphPosition = #top		ifTrue: [alignedPositionY := alignedPositionY + padding top].
	morphPosition = #center 	ifTrue: [alignedPositionY := (alignedPositionY - (aMorphOrForm height / 2)) floor].
	morphPosition = #baseline	ifTrue: [
			alignedPositionY := alignedPositionY - (morphBaselineGetter ifNotNil: [:getter | 
				aMorphOrForm perform: getter] ifNil: [0])].
	morphPosition = #bottom 	ifTrue: [alignedPositionY := (alignedPositionY - aMorphOrForm height) - padding bottom].
	"We only apply padding to the position the morph is aligned to."	
	
	^ alignedPositionY