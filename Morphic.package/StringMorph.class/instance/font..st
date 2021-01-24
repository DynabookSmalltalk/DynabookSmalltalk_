accessing
font: aFont 
	"Set the font my text will use. The emphasis remains unchanged."

	self
		setFont: (aFont emphasized: self emphasis)
		emphasis: self emphasis.