private - running
resume
	status == #paused
		ifTrue: [""
			self startNetwork.
			""
			status _ #running.
			self
				logMessage: ['Resumed!']]
		ifFalse: [""
			self
				logMessage: ['Invalid resume! (status=' , status asString , ')']]