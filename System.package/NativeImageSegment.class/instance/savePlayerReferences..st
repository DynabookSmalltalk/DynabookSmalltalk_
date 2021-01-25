read/write segment
savePlayerReferences: dictOfAllObjects
	| save world |
	"Save our associations we own in the shared References table.  They will be installed when the segment is imported."

	save := OrderedCollection new.
	References associationsDo: [:assoc |
		(dictOfAllObjects includesKey: assoc) ifTrue: [save add: assoc]].
	1 to: 5 do: [:ii | ((arrayOfRoots at: ii) respondsTo: #isCurrentProject) ifTrue: [
					world := (arrayOfRoots at: ii) world]].
	world setProperty: #References toValue: save.
		"assume it is not refed from outside and will be traced"