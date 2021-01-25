as yet unclassified
parse: aStream class: aClass noPattern: noPattern context: ctxt notifying: req ifFail: aBlock

	^ [
		| parseTree structuredCode code |
		parseTree := OMeta2RuleParser matchAll: aStream contents with: #rule.
		structuredCode := OMeta2RuleTranslator match: parseTree with: #translate withArgs: {aClass}.
		code := OMeta2Flattener match: structuredCode with: #flatten.
		Parser new parse: code readStream class: aClass noPattern: noPattern context: ctxt notifying: req ifFail: aBlock
	] on: OM2Fail do: [aBlock value]