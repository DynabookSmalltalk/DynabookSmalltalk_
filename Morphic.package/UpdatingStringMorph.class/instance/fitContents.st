layout
fitContents
	"Overridden to respect minimum and maximum widfth."
	
	| newExtent |
	newExtent :=  self measureContents.
	self extent: ((newExtent x max: self minimumWidth) min: self maximumWidth) @ newExtent y.