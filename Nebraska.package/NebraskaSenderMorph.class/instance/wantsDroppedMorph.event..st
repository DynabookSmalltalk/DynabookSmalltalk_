dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	| dz |
	dz := self valueOfProperty: #specialDropZone ifAbsent: [^false].
	(dz bounds containsPoint: (evt cursorPoint)) ifFalse: [^false].
	^true.