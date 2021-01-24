installing
unload
	| previousVersions |
	self isOverrideMethod ifTrue: [
		previousVersions := self scanForPreviousVersions].
	previousVersions isEmptyOrNil 
		ifTrue: [self actualClass ifNotNil: [:class |
			self removeSelector: selector fromClass: class]]
		ifFalse: [
			"remove our override from history, even if buried below other overrides"
			previousVersions reverseDo: [:version | version fileIn]] 