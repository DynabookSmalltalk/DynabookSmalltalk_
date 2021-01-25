testing
activeClassesByCategory   "NativeImageSegment activeClassesByCategory"
	"Return a dictionary of active classes by system category.
	Useful for finding kernel categories to minimize swapping."

	| active dict |
	active := self activeClasses.
	dict := Dictionary new.
	active do:
		[:c | | cat list | cat := c category.
		list := dict at: cat ifAbsent: [Array new].
		dict at: cat put: (list copyWith: c)].
	^ dict
"
	NativeImageSegment discoverActiveClasses  <-- do it
		-- do something typical --
	NativeImageSegment activeClassesByCategory  <-- inspect it
"