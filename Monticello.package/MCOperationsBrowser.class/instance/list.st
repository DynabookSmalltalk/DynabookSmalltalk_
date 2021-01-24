accessing
list
	| showRevision |
	showRevision := self isViewingRevisions.
	^ self items collect: [:each | | summary |
		summary := showRevision ifTrue: [each summaryAndRevision] ifFalse: [each summary].
		(self reverts includes: each)
			ifFalse: [summary]
			ifTrue: [Text
				string: '( ', summary, ' )'
				attributes: (self userInterfaceTheme revertedOperationAttributes ifNil: [{TextEmphasis struckOut}])]]