menu messages
makeThumbnail
	"Make a thumbnail image of this project from the Display."

	thumbnail := self previewImageForm.
	(Smalltalk at: #InternalThreadNavigationMorph) ifNotNil: [:tnMorph |
		tnMorph cacheThumbnailFor: self].
	^thumbnail
