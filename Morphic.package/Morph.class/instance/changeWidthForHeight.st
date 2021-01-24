layout-menu
changeWidthForHeight
	"Convenience. Configure morphs that do not have a layout policy to be layed out properly in an owner that has such a policy. Tell that owner that I change my width if somebody changes my height."
	
	self
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		wrapDirection: #leftToRight.