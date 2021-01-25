initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	fullDisplay := false.
	
	lastFullUpdateTime := 0.
	self listDirection: #topToBottom;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap