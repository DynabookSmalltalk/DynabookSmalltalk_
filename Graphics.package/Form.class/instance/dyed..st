converting
dyed: aColor
	"Dye this form with the given color. For now, the alpha channel should be sufficient to preserve the meaning of the form."
	
	^ self collectColors: [:ea | aColor alpha: ea alpha]