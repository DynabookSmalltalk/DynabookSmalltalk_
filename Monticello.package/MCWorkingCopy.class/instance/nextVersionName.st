private
nextVersionName
	| branch oldName |
	ancestry ancestors isEmpty
		ifTrue:
			[ counter ifNil: [ counter := 0 ].
			branch := package name ]
		ifFalse:
			[ oldName := ancestry ancestors first versionName.
			branch := oldName packageAndBranchName.
			counter ifNil:
				[ counter := (ancestry ancestors detectMax:
					[ : eachVersionInfo | eachVersionInfo versionNumber ])
					ifNil: [ 0 ]
					ifNotNil:
						[ : highestNumbered | highestNumbered versionNumber ] ] ].
	counter := counter + 1.
	^ branch , '-' , Utilities authorInitials , '.' , counter asString