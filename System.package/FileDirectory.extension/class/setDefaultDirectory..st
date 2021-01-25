*System-Files
setDefaultDirectory: directoryName
	"Initialize the default directory to the directory supplied. This method is called when the image starts up."
	| dirName |
	DirectoryClass := self activeDirectoryClass.
	"There doesn't seem to be any really good reason to use the FilePath conversion stuff here; after all, this method gets sent after having read the image path and explicitly converting it"
	dirName := (FilePath pathName: directoryName) asSqueakPathName.
	[dirName endsWith: self slash] whileTrue:[
		dirName := dirName copyFrom: 1 to: dirName size - self slash size.
	].
	DefaultDirectory := self on: dirName.