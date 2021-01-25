instance creation - specific
method: aMethod selector: aSymbol protocol: prot class: aClass

	| instance |
	instance := self method: aMethod selector: aSymbol class: aClass.
	instance itemProtocol: prot.
	^instance