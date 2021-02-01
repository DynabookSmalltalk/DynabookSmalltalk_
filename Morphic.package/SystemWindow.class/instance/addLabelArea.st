initialization
addLabelArea

	labelArea ifNotNil: [labelArea abandon].
	labelArea := (AlignmentMorph newSpacer: Color transparent)
			vResizing: #spaceFill;
			layoutPolicy: ProportionalLayout new;on: #mouseEnter send: #value to: [labelArea layoutFrame bottomOffset:  0];on: #mouseLeave send: #value to: [labelArea layoutFrame bottomOffset:  (self labelHeight - 5) negated];yourself.
	self addMorph: labelArea.