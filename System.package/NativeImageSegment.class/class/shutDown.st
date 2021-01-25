fileIn/Out
shutDown
	"Delete segment files that can't be used after this image is saved."

	"This is Optional.  
(1) How tell if saving image now?  Only do if is.
(2) NativeImageSegmentRootStub allInstancesDo: 
	If more than one file, delete all but one we are using now.
	Leave files with not stubs (could be out in a segment)
	Must forbid two projects from having the same name!
(3) all Projects do:
	If project is in, delete all files with its name.
"
	