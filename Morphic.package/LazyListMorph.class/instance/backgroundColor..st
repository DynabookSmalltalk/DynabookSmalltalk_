accessing
backgroundColor: aColor

	backgroundColor = aColor ifTrue: [^ self].
	backgroundColor := aColor.

	self changed.
	"Invalidate owner because we want to fill the vertical axis in the viewport entirely."
	self owner ifNotNil: [:o | o changed].