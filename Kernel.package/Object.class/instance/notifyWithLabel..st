error handling
notifyWithLabel: aString 
	"Create and schedule a Notifier with aString as the window label as well as the contents of the window, in  order to request confirmation before a process can proceed."

	self deprecated.
	self notify: aString.
	
	"nil notify: 'let us see if this works'"