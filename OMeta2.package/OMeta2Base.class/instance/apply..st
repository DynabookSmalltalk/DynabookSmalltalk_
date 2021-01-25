rule application
apply: aRule

	" A memoRec is an association whose key is the answer,
	  and whose value is the next input. Failers pretend to
     be memoRecs, but throw a fail in response to #value "
	| memo memoRec |
	input == haltingPoint ifTrue: [self halt].
	memo := input memo.
	memoRec := memo at: aRule ifAbsent: [nil].
	memoRec ifNil: [
		| origInput failer ans |
		origInput := input.
		failer := OM2Failer new.
		memo at: aRule put: failer.
		ans := self perform: aRule.
		memoRec := ans -> input.
		memo at: aRule put: memoRec.
		failer used ifTrue: [
			" left recursion detected "
			| sentinel keepGoing |
			sentinel := input.
			keepGoing := true.
			[keepGoing] whileTrue: [
				[
					input := origInput.
					ans := self perform: aRule.
					input == sentinel ifTrue: [OMeta2Fail signal].
					memoRec key: ans value: input.
				] on: OM2Fail do: [keepGoing := false]
			]
		]		
	].
	input := memoRec value.
	^ memoRec key