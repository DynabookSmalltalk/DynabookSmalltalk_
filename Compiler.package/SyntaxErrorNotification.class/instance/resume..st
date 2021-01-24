accessing
resume: source

	self reparse: source notifying: nil ifFail: nil.
	^ super resume: self defaultResumeValue