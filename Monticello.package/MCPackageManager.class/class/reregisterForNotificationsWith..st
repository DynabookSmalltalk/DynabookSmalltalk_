system changes
reregisterForNotificationsWith: aSystemChangeNotifier
	aSystemChangeNotifier
		notify: self ofSystemChangesOfItem: #class change: #Added using: #classModified:;
		notify: self ofSystemChangesOfItem: #class change: #Modified using: #classModified:;
		notify: self ofSystemChangesOfItem: #class change: #Renamed using: #classModified:;
		notify: self ofSystemChangesOfItem: #class change: #Commented using: #classModified:;
		notify: self ofSystemChangesOfItem: #class change: #Recategorized using: #classMoved:;
		notify: self ofSystemChangesOfItem: #class change: #Removed using: #classRemoved:;
		notify: self ofSystemChangesOfItem: #method change: #Added using: #methodModified:;
		notify: self ofSystemChangesOfItem: #method change: #Modified using: #methodModified:;
		notify: self ofSystemChangesOfItem: #method change: #Recategorized using: #methodMoved:;
		notify: self ofSystemChangesOfItem: #method change: #Removed using: #methodRemoved: