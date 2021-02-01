menu messages
browseIt
	"Launch a browser for the current selection, if appropriate."

	Preferences alternativeBrowseIt ifTrue: [^ self browseClassFromIt].

	self lineSelectAndEmptyCheck: [^ morph flash].

	"First, try to show all accesses to instance or class variables."
	self selectedInstanceVariable ifNotNil:
		[:nameToClass | self systemNavigation
			browseAllAccessesTo: nameToClass key
			from: nameToClass value].
	self selectedClassVariable ifNotNil:
		[:binding | self model browseAllCallsOn: binding].

	"Then, either browse the class (from a binding) or all implementors of a selector."
	self selectedBinding ifNotNil:
		[:binding | ^ self systemNavigation browseClass: binding].
	self selectedSelector ifNotNil:
		[:selector | ^ self model browseAllImplementorsOf: selector].
	
	morph flash