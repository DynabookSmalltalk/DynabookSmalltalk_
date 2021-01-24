menu messages
sendersOfIt
	"Open a senders browser on the selected selector"

	self lineSelectAndEmptyCheck: [^ self].
	self selectedSelector ifNotNil:
		[:aSelector| ^self systemNavigation browseAllCallsOn: aSelector].
	self selectedLiteral ifNotNil:
		[:aLiteral| ^self systemNavigation browseAllCallsOn: aLiteral].
	morph flash