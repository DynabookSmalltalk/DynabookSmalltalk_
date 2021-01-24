open/close
anyOpenWindowLikeMeIn: aPasteUpMorph
	self class reuseWindows ifFalse: [ ^Array empty ].
	^ SystemWindow
		windowsIn: aPasteUpMorph 
		satisfying: 
			[ : each |
			each model class = self model class
				and: [ (each model respondsTo: #representsSameBrowseeAs:) 
				and: [ each model representsSameBrowseeAs: self model ] ] ]
