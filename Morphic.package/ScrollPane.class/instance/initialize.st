initialization
initialize
	
	"initialize the state of the receiver"
	super initialize.
	""
	self initializePreferences.
	hasFocus := false.
	self initializeScrollBars.
	""
	
	self extent: self defaultExtent.
	self updateMinimumExtent.
	
	self setDefaultParameters.
	self addKeyboardCaptureFilter: self.