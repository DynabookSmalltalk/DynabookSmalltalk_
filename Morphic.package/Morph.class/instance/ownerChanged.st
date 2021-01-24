change reporting
ownerChanged
	"This morph's owner has changed its geometry and is about to update its layout. This is a simple layout hook to update this morph's geometry according to its owner.
	
	For more advanced strategies, use a LayoutPolicy with some LayoutProperties. See #layoutPolicy: and maybe also #doLayoutIn:."

	self snapToEdgeIfAppropriate.