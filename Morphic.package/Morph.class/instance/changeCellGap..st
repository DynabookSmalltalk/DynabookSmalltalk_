layout-menu
changeCellGap: evt
	| handle |
	handle := HandleMorph new forEachPointDo:[:newPoint |
		self cellGap: (newPoint - evt cursorPoint) asIntegerPoint // 5].
	evt hand attachMorph: handle.
	handle startStepping.
