stepping and presenter
step

	super step.
	updateCounter = self class updateCounter ifFalse: [self rebuild].
