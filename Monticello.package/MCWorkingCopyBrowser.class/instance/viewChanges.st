actions
viewChanges
	| patch |
	self canSave ifTrue:
		[patch := workingCopy changesRelativeToRepository: self repository withCache.
		patch isNil ifTrue: [ ^self ].
		patch isEmpty
			ifTrue: [ workingCopy modified: false.
				self inform: 'No changes' ]
			ifFalse:
				[ workingCopy modified: true.
				(MCPatchBrowser forPatch: patch)
					label: 'Patch Browser: ', workingCopy description;
					environmentInDisplayingImage: workingCopy environment;
					show ] ]