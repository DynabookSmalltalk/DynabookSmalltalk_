layout
doLayoutIn: layoutBounds
	"Compute paragraph here to reduce visual flickering. Also update the layout of any submorphs, which can be added via text anchors.
	
	autoFit + wrapFlag -> hResizing: #rigid + vResizing: #shrinkWrap
	autoFIt + no wrapFlag -> hResizing: #shrinkWrap + vResizing: #shrinkWrap
	no autoFit + wrapFlag -> hResizing: #rigid + vRresizing: #rigid
	no autoFit + no wrapFlag -> hResizing: #rigid + vRresizing: #rigid"
	
	self submorphsDo: [:m | m fullBounds].	
	self paragraph.
	fullBounds := self privateFullBounds.