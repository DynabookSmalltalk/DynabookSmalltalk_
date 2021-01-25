testing
deepCopyTest: aRootArray
	"NativeImageSegment new deepCopyTest: Morph withAllSubclasses asArray"
	"Project allInstances do:
		[:p | p == Project current ifFalse:
			[Transcript cr; cr; nextPutAll: p name.
			NativeImageSegment new deepCopyTest: (Array with: p)]]."
	| t1 t2 copy |
	t1 := Time millisecondsToRun: [self copyFromRoots: aRootArray sizeHint: 0].
	t2 := Time millisecondsToRun: [copy := self segmentCopy].
	Transcript cr; print: segment size * 4; nextPutAll: ' bytes stored with ';
		print: outPointers size; show: ' outpointers in '; print: t1; show: 'ms.'.
	Transcript cr; nextPutAll: 'Reconstructed in '; print: t2; show: 'ms.'.
	^ copy
"
Smalltalk allClasses do:
	[:m | NativeImageSegment new deepCopyTest: (Array with: m with: m class)]
"