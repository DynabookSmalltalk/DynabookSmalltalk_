world menu
findAPreferencesPanel: evt
	"Locate a Preferences Panel, open it, and bring it to the front.  Create one if necessary"
	Smalltalk at: #PreferenceBrowser ifPresent:[:pb|
		self findAWindowSatisfying:[:aWindow | aWindow model isKindOf: pb]
			orMakeOneUsing:[pb open]
	].