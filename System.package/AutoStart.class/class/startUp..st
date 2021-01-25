initialization
startUp: resuming
	"The image is either being newly started (resuming is true), or it's just been snapshotted.
	If this has just been a snapshot, skip all the startup stuff."

	| startupParameters launchers |
	self active ifTrue: [^self].
	self active: true.
	resuming ifFalse: [^self].

	startupParameters := Smalltalk namedArguments.

	Project current startUpActions.
			
	self processUpdates.

	launchers := self installedLaunchers collect: [:launcher |
		launcher new].
	launchers do: [:launcher |
		launcher parameters: startupParameters].
	launchers do: [:launcher |
		Project current addDeferredUIMessage: [launcher startUp]]