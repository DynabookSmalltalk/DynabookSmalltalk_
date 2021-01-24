actions
renamePackage
	| newName |
	workingCopy ifNil:
		[ UIManager inform: 'Please select a package to be renamed.'.
		^ self ].
	workingCopy modified ifTrue:
		[ UIManager inform: 'Only unmodified packages should be renamed.'.
		^ self ].
	newName := UIManager default
		request: 'New name of package:'
		initialAnswer: workingCopy packageName.
	newName isEmptyOrNil ifFalse:
		[ | newWorkingCopy |
		newWorkingCopy := workingCopy renameToBe: newName.
		workingCopy package snapshot definitions
			ifEmpty:
				[ "It worked."
				workingCopy unregister.
				workingCopy := newWorkingCopy.
				self repositorySelection: 0.
				self
					 workingCopyListChanged ;
					 changed: #workingCopySelection ;
					 changed: #repositoryList.
				self changedButtons ]
			ifNotEmpty: 
				[ "It didn't work, browse the remaining definitions."
				self browseWorkingCopy ] ]