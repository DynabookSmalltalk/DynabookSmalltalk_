initialize-release
initializeWithBase: baseSnapshot target: targetSnapshot
	| base target |	
	operations := OrderedCollection new.
	base := MCDefinitionIndex definitions: baseSnapshot definitions.
	target := MCDefinitionIndex definitions: targetSnapshot definitions.
	
	target definitionsDo:
		[:t |
		base
			definitionLike: t
			ifPresent: [:b | (b isSameRevisionAs: t) ifFalse: [operations add: (MCModification of: b to: t)]]
			ifAbsent: [operations add: (MCAddition of: t)]].
		
	base definitionsDo:
		[:b |
		target
			definitionLike: b
			ifPresent: [:t]
			ifAbsent: [operations add: (MCRemoval of: b)]]		