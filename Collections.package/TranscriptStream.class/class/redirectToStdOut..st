preferences
redirectToStdOut: aBoolean
	"In setting up redirection, first remove all dependents that are stdout,
	 which may include stale files from the last session.  Then add a dependency
	 only if asked to redirect to stdout. Blithely doing
		Transcript removeDependent: FileStream stdout
	 raises an error if stdout is unavailable."
	Transcript dependents do:
		[:dep|
		 (dep isStream and: [dep name = #stdout]) ifTrue:
			[Transcript removeDependent: dep]].
	(RedirectToStdOut := aBoolean) ifTrue:
		[Transcript addDependent: FileStream stdout]