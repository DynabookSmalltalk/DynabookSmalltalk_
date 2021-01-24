priv handling
defaultAction

	^ (Smalltalk classNamed: #ToolSet)
		ifNotNil: [:ts | ts handleWarning: self exception]
		ifNil: ["Ignore like a Notification." nil]