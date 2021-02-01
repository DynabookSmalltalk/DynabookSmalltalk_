*MorphicExtras
previewAllBitBltRulesWithAlpha

	(self previewBitBltRules: (0 to: 41)
		on: ToolIcons flag
		and: ((Color red alpha: 0.4) iconOrThumbnailOfSize: 12)
		fallback: ToolIcons exception
		scaledTo: 32) openInHand.