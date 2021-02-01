*MorphicExtras
previewAllBitBltRules

	(self previewBitBltRules: (0 to: 41)
		on: ToolIcons flag
		and: ToolIcons collection
		fallback: ToolIcons exception
		scaledTo: 32) openInHand.