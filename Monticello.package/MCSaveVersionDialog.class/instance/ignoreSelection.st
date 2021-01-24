actions
ignoreSelection
	selection
		ifNil: [ignore size = items size
			ifFalse: [ignore addAll: items]
			ifTrue: [ignore removeAll]]
		ifNotNil: [
			ignore remove: selection ifAbsent: [
				ignore add: selection].
			self advanceSelection].
	self changed: #list
