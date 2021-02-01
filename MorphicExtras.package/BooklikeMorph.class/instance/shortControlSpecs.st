page controls
shortControlSpecs
	"Answer  specs defining the widgets in the short form of the control panel."

^ {
		{#MenuIcon.		#invokeShortBookMenu. 		'Click here to get a menu of options for this book.' translated}.
		#variableSpacer.
		{#PrevPage. 		#previousPage.			'Previous page' translated}.
		#spacer.
		#pageNumber.
		#spacer.
		{#NextPage.		#nextPage.				'Next page' translated}.
		#spacer.
		#variableSpacer.
		{'...'.		#showMoreControls.		'More controls' translated}
}
