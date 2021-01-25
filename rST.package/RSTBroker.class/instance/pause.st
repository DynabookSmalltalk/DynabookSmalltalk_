private - running
pause
	status == #running
		ifTrue: [""
			self stopNetwork.
			""
			status _ #paused.
			self
				logMessage: ['Paused!']]
		ifFalse: [""self
				logMessage: ['Invalid pause! (status=' , status asString , ')']]