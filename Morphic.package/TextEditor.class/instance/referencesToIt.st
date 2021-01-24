menu messages
referencesToIt
	"Open a MessageSet with the references to the selected global or variable name."

	self wordSelectAndEmptyCheck: [^ self].
	self selectedInstanceVariable ifNotNil:
		[:nameToClass | ^ self systemNavigation
			browseAllAccessesTo: nameToClass key
			from: nameToClass value].
	self selectedBinding ifNotNil:
		[:binding | ^ self systemNavigation browseAllCallsOnClass: binding].
	morph flash.