operations
reparent: aVersion 
	"Let aNode be the sole parent of this version"
	ancestry reparent: aVersion info.
	self
		 checkModified ;
		 changed