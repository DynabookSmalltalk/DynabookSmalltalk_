image, changes names
imageName
	"Answer the full path name for the current image."
	"Smalltalk imageName"

	^ self primImageName vmPathToSqueakPath
