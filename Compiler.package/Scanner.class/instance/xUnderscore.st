multi-character scans
xUnderscore
	self allowUnderscoreAssignments ifTrue:
		"Figure out if x _foo (no space between _ and foo) should be a selector or assignment."
		[(self allowUnderscoreSelectors
		  and: [#(xLetter xDigit xUnderscore xColon) includes: (self typeTableAt: aheadChar)])
			ifFalse:
				[self step.
				 tokenType := #leftArrow.
				 ^token := #'_']].
	self allowUnderscoreSelectors ifTrue:
		[^self xLetter].
	^self xIllegal