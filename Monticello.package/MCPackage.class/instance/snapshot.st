input/output
snapshot
	| packageInfo definitions categories |
	packageInfo := self packageInfo.
	definitions := OrderedCollection new.
	categories := packageInfo systemCategories.
	categories isEmpty ifFalse: [ definitions add: (MCOrganizationDefinition categories: categories) ].
	CurrentReadOnlySourceFiles cacheDuring: [
		packageInfo methods do: [:ea | definitions add: ea asMethodDefinition] displayingProgress: 'Snapshotting methods...'.
		(packageInfo respondsTo: #overriddenMethods) ifTrue:
			[packageInfo overriddenMethods
				do: [:ea | definitions add:
						(packageInfo changeRecordForOverriddenMethod: ea) asMethodDefinition]
				displayingProgress: 'Searching for overrides...'].
		packageInfo classes do: [:ea | definitions addAll: ea classDefinitions] displayingProgress: 'Snapshotting classes...' ].
	(packageInfo respondsTo: #hasPreamble) ifTrue: [
		packageInfo hasPreamble ifTrue: [definitions add: (MCPreambleDefinition from: packageInfo)].
		packageInfo hasPostscript ifTrue: [definitions add: (MCPostscriptDefinition from: packageInfo)].
		packageInfo hasPreambleOfRemoval ifTrue: [definitions add: (MCRemovalPreambleDefinition from: packageInfo)].
		packageInfo hasPostscriptOfRemoval ifTrue: [definitions add: (MCRemovalPostscriptDefinition from: packageInfo)]]. 
	^ MCSnapshot fromDefinitions: definitions
