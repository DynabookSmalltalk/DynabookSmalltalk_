private
requestVersionNameAndMessageWithSuggestion: nameString initialMessage: msgString patchBlock: aPatchBlock
	^ (MCVersionNameAndMessageRequest new
		suggestedName: nameString;
		initialMessage: msgString;
		patchBlock: aPatchBlock
		) signal