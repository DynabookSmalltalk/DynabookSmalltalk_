world menu
closeUnchangedWindows
	"Present a menu of window titles for all windows with changes,
	and activate the one that gets chosen."
	(UIManager default confirm:
'Do you really want to close all windows
except those with unaccepted edits?' translated)
		ifFalse: [^ self].

	(SystemWindow windowsIn: self satisfying: [:w | w model canDiscardEdits])
		do: [:w | w delete]