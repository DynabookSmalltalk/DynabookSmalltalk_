as yet unclassified
openMenuIn: aBlock
	
	self resume: (UIManager default
		confirm: name asText allBold, ' appears to be unused in this method.\Remove it from the code?' withCRs
		title: 'Unused Variable').