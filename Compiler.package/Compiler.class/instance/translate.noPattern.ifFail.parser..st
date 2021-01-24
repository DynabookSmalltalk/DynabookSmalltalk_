public access
translate: aStream noPattern: noPattern ifFail: failBlock parser: parser
	| tree |
	tree := parser
			parseCue: cue 
			noPattern: noPattern
			ifFail: [^ failBlock value].
	^ tree