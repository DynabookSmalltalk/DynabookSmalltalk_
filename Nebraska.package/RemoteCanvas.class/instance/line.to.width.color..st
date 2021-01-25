drawing
line: point1 to: point2 width: width color: color
	"Draw a line using the given width and color"
	self drawCommand: [ :executor |
		executor line: point1 to: point2 width: width color: color ]