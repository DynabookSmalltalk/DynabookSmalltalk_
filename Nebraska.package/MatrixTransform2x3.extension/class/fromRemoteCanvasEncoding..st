*nebraska-instance creation
fromRemoteCanvasEncoding: encoded
	"DisplayTransform fromRemoteCanvasEncoding:  'Matrix,1065353216,0,1137541120,0,1065353216,1131610112,'"
	| nums transform encodedNums |
	"split the numbers up"
	encodedNums := encoded findTokens: ','.

	"remove the initial 'Matrix' specification"
	encodedNums := encodedNums asOrderedCollection.
	encodedNums removeFirst.

	"parse the numbers"
	nums := encodedNums collect: [ :enum |
		Integer readFromString: enum ].

	"create an instance"
	transform := self new.

	"plug in the numbers"
	nums doWithIndex: [ :num :i |
		transform basicAt: i put: num ].

	^transform