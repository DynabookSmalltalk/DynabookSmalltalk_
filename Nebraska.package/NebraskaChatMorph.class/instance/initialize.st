initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	acceptOnCR := true.
	self listDirection: #topToBottom;
		 layoutInset: 0;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 rubberBandCells: false;
		 minWidth: 200;
		 minHeight: 200;
		 rebuild 