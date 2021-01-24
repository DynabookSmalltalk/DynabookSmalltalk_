closures
nestedBlockMethods
	"Answer a collection of the block methods of blocks within the receiver, if any."
	| nestedBlockMethods iterator |
	nestedBlockMethods := OrderedCollection new.
	iterator := [:m| | nLits |
				nLits := m numLiterals.
				2 to: (m isCompiledBlock ifTrue: [nLits] ifFalse: [nLits - 1]) do:
					[:index | | lit |
					lit := m objectAt: index.
					lit isCompiledCode ifTrue:
						[iterator value: (nestedBlockMethods add: lit)]]].
	iterator value: self.
	^nestedBlockMethods
