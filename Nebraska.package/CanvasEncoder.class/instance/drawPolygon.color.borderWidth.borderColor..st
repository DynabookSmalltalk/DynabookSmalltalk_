drawing
drawPolygon: vertices color: aColor borderWidth: bw borderColor: bc
	| encodedVertices |
	encodedVertices := vertices collect: [ :vertex | self class encodePoint: vertex ].

	self sendCommand: {
		String with: CanvasEncoder codePoly.
		self class encodeColor: aColor.
		self class encodeInteger: bw.
		self class encodeColor: bc},  encodedVertices .