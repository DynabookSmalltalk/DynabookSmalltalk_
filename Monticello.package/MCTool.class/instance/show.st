morphic ui
show
	modalProcess := nil.
	Smalltalk at: #ToolBuilder ifPresent: [:tb | tb open: self. ^ self].
	^self window openInWorldExtent: self defaultExtent; yourself