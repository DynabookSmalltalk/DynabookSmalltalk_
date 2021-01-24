private
basicLoad
	"Load the contents of some package. This is the core loading method
	in Monticello. Be wary about modifying it unless you understand the details
	and dependencies of the various entities being modified."
	| pkgName |
	errorDefinitions := OrderedCollection new.
	"Obviously this isn't the package name but we don't have anything else
	to use here. ChangeSet current name will generally work since a CS is 
	usually installed prior to installation."
	pkgName := ChangeSet current name.
	preamble ifNotNil: [ChangeSet current preambleString: (self preambleAsCommentNamed: pkgName)].

RecentMessages default suspendWhile: [
	[CurrentReadOnlySourceFiles cacheDuring: [[
	"Pass 1: Load everything but the methods,  which are collected in methodAdditions."
	additions do: [:ea | 
		ea isMethodDefinition 
			ifTrue:[methodAdditions add: ea asMethodAddition]
			ifFalse:[[ea load]on: Error do: [errorDefinitions add: ea]].
	] displayingProgress: 'Reshaping ', pkgName.

	"Try again any delayed definitions"
	self shouldWarnAboutErrors ifTrue: [self warnAboutErrors].
	errorDefinitions do: [:ea | ea load] 
		displayingProgress: 'Reloading ', pkgName.

	"Pass 2: We compile new / changed methods"
	methodAdditions do:[:ea| ea createCompiledMethod] 
		displayingProgress: 'Compiling ', pkgName.

	'Installing ', pkgName displayProgressFrom: 0 to: 2 during:[:bar|
		"There is no progress *during* installation since a progress bar update
		will redraw the world and potentially call methods that we're just trying to install."
		bar value: 1.

		"Pass 3: Install the new / changed methods
		(this is a separate pass to allow compiler changes to be loaded)"
		methodAdditions do:[:ea| ea installMethod].

		"Pass 4: Remove the obsolete methods"
		removals do:[:ea| ea unload].
	].

	"Finally, notify observers for the method additions"
	methodAdditions do: [:each | each notifyObservers] 
		"the message is fake but actually telling people how much time we spend
		in the notifications is embarrassing so lie instead"
		displayingProgress: 'Installing ', pkgName.

	additions do: [:ea | ea postloadOver: (self obsoletionFor: ea)] 
		displayingProgress: 'Initializing ', pkgName.

	] on: InMidstOfFileinNotification do: [:n | n resume: true]
	]] ensure: [self flushChangesFile]
]