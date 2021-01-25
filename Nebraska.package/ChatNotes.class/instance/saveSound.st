file i/o
saveSound
	"Move the sound from the recorder to the files."
	| fname file |
	
	recorder recordedSound ifNil: [^self].
	self isSaving: true.
	fname := self getNextName.
	"Create .name file"
	file := self audioDirectory newFileNamed: (fname, 'name').
	file nextPutAll: self textMorphString.
	file close.
	"Create .aiff file"
	file := (self audioDirectory newFileNamed: (fname, 'aiff')) binary.
	self storeAIFFOnFile: file.
	file close.
	"Add to names and notes"
	names add: self textMorphString.
	notes add: fname.
	self changed: #notesList.
	self notesListIndex: (notes size).
	"Clear Recorder"
	recorder := SoundRecorder new.
	"Stop Button"
	self isSaving: false