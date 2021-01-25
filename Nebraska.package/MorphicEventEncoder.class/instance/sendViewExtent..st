network I/O
sendViewExtent: newExtent
	"inform the opposite side that our view extent has changed"
	
	connection nextPut: { 'viewExtent'. CanvasEncoder encodePoint: newExtent }
