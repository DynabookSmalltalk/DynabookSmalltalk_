handling
defaultAction
	^ (MCMergeBrowser new
		merger: merger;
		label: messageText) showModally