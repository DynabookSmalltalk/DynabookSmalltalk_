dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	(aMorph isKindOf: NebraskaSenderMorph) ifFalse: [^false].
	(bounds containsPoint: evt cursorPoint) ifFalse: [^false].
	^true.