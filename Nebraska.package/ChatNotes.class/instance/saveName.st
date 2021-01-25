file i/o
saveName
	"Save the name to the '.name' file."
	| dir file |

	self name: self textMorphString.
	dir := self audioDirectory.
	file := (notes at: notesIndex), 'name'.
	(dir fileExists: file) ifTrue: [dir deleteFileNamed: file].
	file := dir newFileNamed: file.
	file nextPutAll: name.
	file close.
	names at: notesIndex put: name.
	self changed: #notesList.