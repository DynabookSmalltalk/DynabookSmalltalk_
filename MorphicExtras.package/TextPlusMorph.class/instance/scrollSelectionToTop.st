menus
scrollSelectionToTop

	(self parentGeeMail ifNil: [^self])
		scrollSelectionIntoView: nil 
		alignTop: true 
		inTextMorph: self.
