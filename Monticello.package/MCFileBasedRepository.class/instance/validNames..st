private
validNames: selectorSymbol
	| answer |
	answer := Set new.
	self allFileNamesOrCache do:
		[ : each | | versionName |
		versionName := each asMCVersionName.
		versionName isValid ifTrue: [ answer add: (versionName perform: selectorSymbol) ] ].
	^ answer