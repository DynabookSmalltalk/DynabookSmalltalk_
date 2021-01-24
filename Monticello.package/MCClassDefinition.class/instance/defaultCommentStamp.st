initializing
defaultCommentStamp
	^ String new

	"The version below avoids stomping on stamps already in the image

	^ (Smalltalk at: name ifPresent: [:c | c organization commentStamp])
		ifNil: ['']
	"
