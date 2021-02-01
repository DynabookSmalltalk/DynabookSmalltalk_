private - postscript canvases
hOverW

	^self printSpecs landscapeFlag ifTrue: [
		8.5 /  11.0
	] ifFalse: [
		11.0 / 8.5
	].
