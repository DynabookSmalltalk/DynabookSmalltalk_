stepping and presenter
step

	| now |

	self server ifNil: [ ^self ].
	self server step.
	now := Time millisecondClockValue.
	(now - lastFullUpdateTime) abs > 5000 ifTrue: [
		lastFullUpdateTime := now.
		(previousBacklog = self server backlog and: [self server clients = previousClients]) ifFalse: [
			previousClients := self server clients copy.
			self rebuild
		]
	].
