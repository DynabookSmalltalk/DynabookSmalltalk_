methods
addMethodChange: aChangeRecord
	| selector |
	selector := self newParser parseSelector: aChangeRecord string.
	self organization classify: selector under: aChangeRecord category.
	self sourceCodeAt: selector put: aChangeRecord