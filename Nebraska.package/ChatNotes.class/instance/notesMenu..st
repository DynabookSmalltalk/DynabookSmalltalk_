morphic
notesMenu: aMenu
	"Simple menu to delete notes"
	^(notesIndex = 0)
		ifTrue: [aMenu labels: 'update notes' lines: #() selections: #(updateNotes)]
		ifFalse: [aMenu labels: ('delete', String cr, 'update notes') lines: #() selections: #(deleteSelection updateNotes)]