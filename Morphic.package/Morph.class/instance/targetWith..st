meta-actions
targetWith: evt
	"Some other morph become target of the receiver"
	|  morphs newTarget |
	morphs := self potentialTargets.
	newTarget := UIManager default
		chooseFrom: (morphs collect: [:m | m knownName ifNil:[m class name asString]])
		values: morphs
		title:  self externalName, ' targets...'.
	newTarget ifNil:[^self].
	self target: newTarget.