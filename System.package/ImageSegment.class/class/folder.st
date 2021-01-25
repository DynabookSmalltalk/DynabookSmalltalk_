fileIn/Out
folder
	| im |
	"Full path name of segments folder.  Be sure to duplicate and rename the folder when you duplicate and rename an image.  Is $_ legal in all file systems?"

	im := Smalltalk imageName.
	^ (im copyFrom: 1 to: im size - 6 "'.image' size"), '_segs'