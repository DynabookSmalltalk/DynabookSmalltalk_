private
baselineAdjustmentFor: textAnchorProperties

	^ textAnchorProperties verticalAlignmentLine caseOf: {
				[#top] -> [font ascent].
				[#center] -> [(font ascent / 2) floor].
				[#baseline] -> [0].
				[#bottom] -> [font descent negated]}.
			
	