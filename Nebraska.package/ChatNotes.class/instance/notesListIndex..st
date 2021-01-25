accessing
notesListIndex: index
	
	notesIndex := index = notesIndex ifTrue: [0] ifFalse: [index].
	self name: (self notesList at: notesIndex ifAbsent: ['']).
	self changed: #notesListIndex.