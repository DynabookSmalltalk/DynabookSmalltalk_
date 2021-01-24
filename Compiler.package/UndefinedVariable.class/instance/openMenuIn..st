as yet unclassified
openMenuIn: aBlock

	^ self resume: (UIManager default
		confirm: name asText allBold, ' appears to be undefined at this point.\Proceed anyway?' withCRs
		title: 'Undefined Variable').