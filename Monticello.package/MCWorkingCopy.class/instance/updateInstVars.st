migration
updateInstVars
	ancestry ifNil:
		[ancestry := MCWorkingAncestry new.
		versionInfo ifNotNil:
			[versionInfo ancestors do: [:ea | ancestry addAncestor: ea].
			versionInfo := nil]]