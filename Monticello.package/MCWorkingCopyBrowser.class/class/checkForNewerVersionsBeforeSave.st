preferences
checkForNewerVersionsBeforeSave
	"Preference accessor"
	<preference: 'Check for new versions before save'
		category: 'Monticello'
		description: 'If true, MC will warn before committing to repositories that have possibly newer versions of the package being saved.'
		type: #Boolean>
	^CheckForNewerVersionsBeforeSave ifNil:[true]