stepping and presenter
step

	super step.
	(nebraskaBorder isNil or: [nebraskaBorder world isNil]) ifTrue: [self delete].