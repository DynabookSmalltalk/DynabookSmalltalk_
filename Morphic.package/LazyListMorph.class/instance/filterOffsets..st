list access - cached
filterOffsets: row
	"Do inst-var access on listFilterOffsets here to initialize it as late as possible."
	
	listFilterOffsets ifNil: [listFilterOffsets := Array new: self getListSize].
		
	^ (listFilterOffsets at: row) ifNil: [
		| offsets |
		offsets := self getFilterOffsets: row.
		listFilterOffsets at: row put: offsets.
		offsets]