system startup
startUp: resuming
	"Ensure Monticello is receiving system change notifications."

	resuming ifTrue:
		[Smalltalk
			at: #SystemChangeNotifier
			ifPresent: [:scn| self reregisterForNotificationsWith: scn uniqueInstance]]
