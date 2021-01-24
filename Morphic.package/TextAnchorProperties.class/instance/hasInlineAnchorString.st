menu
hasInlineAnchorString

	^ (self anchorLayout == #inline
			ifTrue: ['<on>']
			ifFalse: ['<off>'])
		, 'inline' translated