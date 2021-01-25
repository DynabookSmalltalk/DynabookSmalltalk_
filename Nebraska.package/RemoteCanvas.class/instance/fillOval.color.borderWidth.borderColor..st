drawing-ovals
fillOval: bounds color: color borderWidth: borderWidth borderColor: borderColor
	"Fill the given oval."
	self drawCommand: [ :executor |
		executor fillOval: bounds color: color borderWidth: borderWidth borderColor: borderColor
	].