sub-projects & hierarchy
beTopProject

	| previousTop |
	self isTopProject ifTrue: [^ self].
	
	previousTop := self class topProject.
	
	self parent deletingProject: self. "Just remove views and refs to me."
	self addProject: previousTop. "The current top project will be my child now."
	self setParent: self. "I am the new top project."