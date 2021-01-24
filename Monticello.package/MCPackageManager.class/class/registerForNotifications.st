system changes
registerForNotifications
	Smalltalk
		at: #SystemChangeNotifier
		ifPresent:
			[:cls|
			cls uniqueInstance noMoreNotificationsFor: self.
			self reregisterForNotificationsWith: cls uniqueInstance]