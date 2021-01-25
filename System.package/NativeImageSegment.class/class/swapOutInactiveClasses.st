testing
swapOutInactiveClasses  "NativeImageSegment swapOutInactiveClasses"  
	"Make up segments by grouping unused classes by system category.
	Read about, and execute discoverActiveClasses, and THEN execute this one."

	| unused groups |
	NativeImageSegment recoverFromMDFault.
	ImageSegmentRootStub recoverFromMDFault.
	unused := Smalltalk allClasses select: [:c | (c instVarNamed: 'methodDict') == nil].
	unused do: [:c | c recoverFromMDFault].
	groups := Dictionary new.
	SystemOrganization categories do:
		[:cat | | i |
		i := (cat findLast: [:c | c = $-]) - 1.
		i <= 0 ifTrue: [i := cat size].
		groups at: (cat copyFrom: 1 to: i)
			put: (groups at: (cat copyFrom: 1 to: i) ifAbsent: [Array new]) ,
			((SystemOrganization superclassOrder: cat) select: [:c | 
				unused includes: c]) asArray].
	groups keys do:
		[:cat | | roots | roots := groups at: cat.
		Transcript cr; cr; show: cat; cr; print: roots; endEntry.
		roots := roots , (roots collect: [:c | c class]).
		(cat beginsWith: 'Sys' "something here breaks") ifFalse:
			[(NativeImageSegment new copyFromRoots: roots sizeHint: 0) extract; 
				writeToFile: cat].
		Transcript cr; print: Smalltalk bytesLeft "does a gc"; endEntry]