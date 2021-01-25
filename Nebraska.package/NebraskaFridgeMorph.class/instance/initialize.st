initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	groupMode := true.
	self listDirection: #topToBottom;
		 layoutInset: 10;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 setProperty: #normalBorderColor toValue: self borderColor;
		 setProperty: #flashingColors toValue: {Color red. Color yellow};
		 rebuild