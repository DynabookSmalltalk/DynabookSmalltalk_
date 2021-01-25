file i/o
deleteSelection
	"Delete the selection in the list"
	| dir |

	notesIndex <= 0 ifTrue: [^self].
	dir := self audioDirectory.
	dir deleteFileNamed: ((notes at: notesIndex), 'name') ifAbsent: [].
	dir deleteFileNamed: ((notes at: notesIndex), 'aiff') ifAbsent: [].
	names removeAt: notesIndex.
	notes removeAt: notesIndex.
	self notesListIndex: 0.
	self changed: #notesList.
	self changed: #name.