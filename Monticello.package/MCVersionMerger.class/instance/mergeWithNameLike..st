merging
mergeWithNameLike: baseName
	records do: [:ea | merger addBaseSnapshot: ea packageSnapshot].
	records do: [:ea | merger applyPatch: ea mergePatch].
	self resolveConflicts ifTrue:
		[merger loadWithNameLike: baseName.
		records do: [:ea | ea updateWorkingCopy]].