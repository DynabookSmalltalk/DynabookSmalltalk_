layout-menu
changeHeightForWidth
	"Convenience. Configure morphs that do not have a layout policy to be layed out properly in an owner that has such a policy. Tell that owner that I change my height if somebody changes my width."
	
	self
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		wrapDirection: #topToBottom.