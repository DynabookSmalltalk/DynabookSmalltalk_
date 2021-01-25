drawing-polygons
drawPolygon: vertices color: aColor borderWidth: bw borderColor: bc
	self drawCommand: [ :c |
		c drawPolygon: vertices color: aColor borderWidth: bw borderColor: bc ]