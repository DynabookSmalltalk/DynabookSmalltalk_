ui
buttonSpecs
	^ #((Merge merge 'Proceed with the merge' canMerge)
		 (Cancel cancel 'Cancel the merge')
		('All Newer' chooseAllNewerConflicts 'Choose all newer conflict versions')
		('All Older' chooseAllOlderConflicts 'Choose all older conflict versions')
		('Rest Reject' chooseAllUnchosenLocal 'Choose local versions of all remaining conflicts')
		('Rest Accept' chooseAllUnchosenRemote 'Choose remote versions of all remaining conflicts')
		('Accept same source' chooseAllSameAST 'Choose all local conflicting versions that have essentially the same code')
)