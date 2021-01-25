event handling
mouseUp: localEvt

	(self containsPoint: localEvt cursorPoint) ifFalse: [^self].
	Project enterIfThereOrFind: 'Fridge'