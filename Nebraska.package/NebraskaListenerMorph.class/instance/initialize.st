initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self listDirection: #topToBottom;
		 layoutInset: 4;
		 rebuild 