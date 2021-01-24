layout
submorphBoundsForShrinkWrap
	"Since we have no submorphs, we calculate those bounds here. Skip width calculation if we do not #shrinkWrap."

	^ self hResizing == #shrinkWrap
		ifTrue: [(self topLeft extent: self maxWidth @ self maxHeight) insetBy: self cellInset]
		ifFalse: [self topLeft extent: 0 @ (self maxHeight - self cellInset top - self cellInset bottom)]