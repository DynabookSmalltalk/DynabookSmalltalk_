initialization
vertices: verts borderWidth: bw borderColor: bc 
	super initialize.
	vertices := verts.
	
	self borderWidth: bw.
	self borderColor: bc.
	
	closed := false.
	arrows := #none.
	self computeBounds