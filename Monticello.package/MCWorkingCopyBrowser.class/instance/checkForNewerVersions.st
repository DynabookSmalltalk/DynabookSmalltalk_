actions
checkForNewerVersions
	| newer |
	newer := workingCopy possiblyNewerVersionsIn: self repository.
	^ newer isEmpty or: [
		self confirm: 'CAUTION! These versions in the repository may be newer:', 
			String cr, ((newer asCommaString withNoLineLongerThan:  150) truncateWithElipsisTo: 5 * 149), String cr,
			'Do you really want to save this version?'].