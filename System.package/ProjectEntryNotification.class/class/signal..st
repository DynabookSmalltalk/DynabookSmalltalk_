exceptionInstantiator
signal: aProject

	| ex |
	ex := self new.
	ex projectToEnter: aProject.
	^ex signal: 'Entering ',aProject printString