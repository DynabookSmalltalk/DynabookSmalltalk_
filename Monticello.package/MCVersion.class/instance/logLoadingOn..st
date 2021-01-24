printing
logLoadingOn: aStream
	aStream
		nextPutAll: '========== ', self info name, ' =========='; cr;
		nextPutAll: self info message asString; cr;
		flush.

	package hasWorkingCopy ifFalse: [^self].

	package workingCopy ancestors do: [:each |
		(self info hasAncestor: each)
			ifTrue: [(self info allAncestorsOnPathTo: each)
				do: [:ver | aStream cr; nextPutAll: '>>> ', ver name, ' <<<'; cr;
							nextPutAll: ver message; cr; flush]]]