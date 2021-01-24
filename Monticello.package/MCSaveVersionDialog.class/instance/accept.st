actions
accept
	| logMessage logMessageWidget |
	self updateItems.
	logMessage := (logMessageWidget := self findTextMorph: #logMessage) text asString.
	(logMessage isEmpty or: [logMessage beginsWith: 'empty log message'])
		ifTrue:
			[(UIManager confirm: 'the log message is empty; are you sure you want to commit') ifFalse: [^ self]]
		ifFalse: [logMessageWidget accept].
	self answer: {
		(self findTextMorph: #versionName) text asString.
		logMessage.
		ignore }