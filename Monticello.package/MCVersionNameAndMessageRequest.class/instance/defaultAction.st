handling
defaultAction
	^ MCSaveVersionDialog new
		versionName: suggestion;
		logMessage: initialMessage;
		patchBlock: patchBlock;
		selection: 1;
		showModally