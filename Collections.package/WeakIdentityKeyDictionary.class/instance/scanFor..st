private
scanFor: anObject
	"Scan the key array for the first slot containing either a nil (indicating an empty slot) or an element that matches anObject. Answer the index of that slot or raise an error if no slot is found. This method will be overridden in various subclasses that have different interpretations for matching elements."

	| index start size |
	index := start := anObject scaledIdentityHash \\ (size := array size) + 1.
	[ 
		| element |
		((element := array at: index) == nil or: [ element key == anObject ])
			ifTrue: [ ^index ].
		(index := index \\ size + 1) = start ] whileFalse.
	self errorNoFreeSpace