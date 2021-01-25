file i/o
updateNotes
	"Probably not necessary unless several audio notes are
	open at the same time"

	"Clear Notes"
	self loadNotes.
	self changed: #notesList.
	self notesListIndex: 0.
	self name: ''.