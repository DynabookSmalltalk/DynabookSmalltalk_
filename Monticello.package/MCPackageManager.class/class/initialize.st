class initialization
initialize
	"Remove this later"
	Smalltalk at: #SystemChangeNotifier ifPresent:[:cls|
		(cls uniqueInstance) noMoreNotificationsFor: self.
	].