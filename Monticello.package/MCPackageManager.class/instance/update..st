system changes
update: aSymbol
	InMidstOfFileinNotification signal ifFalse: [
	[((aSymbol = #recentMethodSubmissions)
		and: [self packageInfo
				includesMethodReference: RecentMessages default mostRecent])
					ifTrue: [self modified: true]]
		on: Error do: []]