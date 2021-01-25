private
setRed: r green: g blue: b range: range
	"Initialize this color's r, g, and b components to the given values in the range [0..r]."

	^ self setRed: r / range green: g / range blue: b / range