ui
morphicOpen: aWorkingCopy 
	^ self repositories do: [:repo | repo morphicOpen: aWorkingCopy].