instruction decoding
jump: distance if: condition 
	"Simulate the action of a 'conditional jump' bytecode whose offset is the 
	 argument, distance, and whose condition is the argument, condition."

	| bool |
	bool := self pop.
	condition == bool
		ifTrue: [self jump: distance]
		ifFalse:
			[(true == bool or: [false == bool]) ifFalse:
				[^self send: #mustBeBooleanIn: to: bool with: {self}]]