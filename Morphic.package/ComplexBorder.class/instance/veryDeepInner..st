copying
veryDeepInner: aDeepCopier
	super veryDeepInner: aDeepCopier.
	style := style veryDeepCopyWith: aDeepCopier.
	colors := colors veryDeepCopyWith: aDeepCopier.
	lineStyles := lineStyles veryDeepCopyWith: aDeepCopier.