accessing
identifier =

	spaces tsIdentifier:x ~$: -> [' ', (x first isUppercase ifTrue: [targetNamespace mangleClass: x] ifFalse: [x])]