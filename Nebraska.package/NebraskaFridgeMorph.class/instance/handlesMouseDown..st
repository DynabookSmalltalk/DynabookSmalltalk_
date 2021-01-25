event handling
handlesMouseDown: globalEvt

	| localCursorPoint |
	localCursorPoint := self globalPointToLocal: globalEvt cursorPoint.
	groupMode ifFalse: [
		self allMorphsDo: [ :each |
			(each isKindOf: NebraskaSenderMorph) ifTrue: [
				(each bounds containsPoint: localCursorPoint) ifTrue: [^false].
			].
		].
	].
	^true