menu messages
sendersOfIt
	"Open a senders browser on the selected selector"

	self lineSelectAndEmptyCheck: [^ self].
	self selectedSelector ifNotNil:
		[:aSelector| ^self model browseAllCallsOn: aSelector].
	self selectedLiteral ifNotNil:
		[:aLiteral| ^self model browseAllCallsOn: aLiteral].
	morph flash