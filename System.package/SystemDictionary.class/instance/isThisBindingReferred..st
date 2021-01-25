classes and traits
isThisBindingReferred: binding

	self systemNavigation allSelectorsAndMethodsDo: [ :behavior :selector :method |
		(method instVarsInclude: binding) ifTrue: [ 
			method allLiteralsDo: [ :literal | "Avoid possible false positives from the primitive."
				literal == binding ifTrue: [ ^true ] ] ] ].
	^false