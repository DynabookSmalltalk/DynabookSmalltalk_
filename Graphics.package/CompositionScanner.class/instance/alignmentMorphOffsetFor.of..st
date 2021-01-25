private
alignmentMorphOffsetFor: textAnchorProperties of: aMorphOrForm

	^ textAnchorProperties verticalAlignmentMorph caseOf: {
				[#top] -> [textAnchorProperties padding top].
				[#center] -> [(aMorphOrForm height / 2) floor].
				[#baseline] -> [textAnchorProperties morphBaselineGetter
					ifNil: [0]
					ifNotNil: [:s | aMorphOrForm perform: s]].
				[#bottom] -> [aMorphOrForm height + textAnchorProperties padding bottom]}