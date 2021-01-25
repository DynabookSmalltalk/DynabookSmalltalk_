instance creation - specific
method: aMethod protocol: prot class: aClass

	| instance |
	instance := self method: aMethod class: aClass.
	instance itemProtocol: prot.
	^instance