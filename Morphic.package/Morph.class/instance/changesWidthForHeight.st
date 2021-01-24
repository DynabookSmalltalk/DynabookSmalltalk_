layout-menu
changesWidthForHeight
	
	^ (self hResizing = #shrinkWrap
		and: [self vResizing ~= #shrinkWrap])
		and: [self wrapDirection ~= #none]