accessing
sourceText

	^(self isClassPatch
		ifFalse: [ TextDiffBuilder ]
		ifTrue: [ ClassDiffBuilder ])
			buildDisplayPatchFrom: self fromSource
			to: self toSource
			inClass: self targetClass
			prettyDiffs: (
				Preferences diffsWithPrettyPrint and: [
					self targetClass notNil and: [
					self isClassPatch not ] ])