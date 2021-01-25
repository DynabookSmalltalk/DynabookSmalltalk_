initialization
initialize
	"initialize the state of the receiver"
	Socket initializeNetwork.
	"we may want our IP address"
	Preferences defaultAuthorName.
	"seems like a good place to insure we have a name"
	super initialize.
	""
	self listDirection: #topToBottom;
		 layoutInset: 4;
		 setProperty: #normalBorderColor toValue: self borderColor;
		 setProperty: #flashingColors toValue: {Color red. Color yellow}