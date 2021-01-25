initialization
loadNotes
	"Load notes from the files"
	| dir |

	names := OrderedCollection new.
	notes := OrderedCollection new.
	(FileDirectory default directoryExists: 'audio')
		ifFalse: [^self].
	dir := self audioDirectory.
	dir fileNames do: [:fname |
		(fname endsWith: '.name') ifTrue: [
			names add: ((dir fileNamed: fname) contentsOfEntireFile).
			notes add: (fname copyFrom: 1 to: (fname size - 4))]].