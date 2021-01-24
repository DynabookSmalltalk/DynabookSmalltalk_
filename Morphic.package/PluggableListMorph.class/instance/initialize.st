initialization
initialize
	listMorph := self createListMorph.
	super initialize.
	self scroller
		layoutPolicy: TableLayout new;
		addMorph: listMorph.	
	self
		minimumWidth: (self font widthOf: $m) * 5 ;
		minimumHeight: self font height
	
	