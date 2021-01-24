events
mouseUp: anEvent 
	(self bounds containsPoint: anEvent cursorPoint) ifFalse: [ anEvent hand showTemporaryCursor: nil ].
	self class fastSplitterResize ifTrue: [ self updateFromEvent: anEvent ].
	traceMorph ifNotNil:
		[ traceMorph delete.
		traceMorph := nil ].

	"balanceOffsets currently disrupts Smart Splitter behavior."
	(ProportionalSplitterMorph smartVerticalSplitters or: [ ProportionalSplitterMorph smartHorizontalSplitters ]) ifFalse: [ self balanceOffsets ]