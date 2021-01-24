initialization
createButtonRow

	^ buttonRow := Morph new
		name: 'Buttons';
		color: Color transparent;
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #center;
		cellGap: 5;
		yourself