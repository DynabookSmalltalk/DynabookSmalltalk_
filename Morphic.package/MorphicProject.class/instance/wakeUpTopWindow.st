enter
wakeUpTopWindow
	"Image has been restarted, and the startUp list has been processed. Perform
	any additional actions needed to restart the user interface."

	SystemWindow wakeUpTopWindowUponStartup.
	Preferences mouseOverForKeyboardFocus ifTrue: 
		[ "Allow global command keys to work upon re-entry without having to cause a focus change first."
		ActiveHand releaseKeyboardFocus ]