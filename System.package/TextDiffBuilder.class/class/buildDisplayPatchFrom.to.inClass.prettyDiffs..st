instance creation
buildDisplayPatchFrom: sourceText to: destinationText inClass: sourceClass prettyDiffs: prettyDiffs
	
	^((sourceClass notNil and: [ prettyDiffs ])
		ifFalse: [ self from: sourceText to: destinationText ]
		ifTrue: [
			PrettyTextDiffBuilder
				from: sourceText
				to: destinationText
				inClass: sourceClass ]) buildDisplayPatch