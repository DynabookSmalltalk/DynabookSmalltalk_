accessing
visibleList
	"For convenience. Avoid accessing #getList directly. Just use the same protocol that my #listMorph uses."
	
	^ self listSize = 0
		ifTrue: [ Array empty ]
		ifFalse:
			[ (self topVisibleRowIndex to: self bottomVisibleRowIndex) collect:
				[ :viewIndex |
					self itemAt: viewIndex ] ].