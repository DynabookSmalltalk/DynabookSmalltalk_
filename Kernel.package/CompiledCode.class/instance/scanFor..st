scanning
scanFor: byteOrClosure
	"Answer whether the receiver contains the argument as a bytecode, if it is a number,
	 or evaluates to true if a block.  If a block it can take from one to four bytes."
	| s end |
	^(s := InstructionStream on: self)
		scanFor: (byteOrClosure isBlock
					ifTrue: [byteOrClosure numArgs caseOf: {
							[1] -> [byteOrClosure].
							[2] -> [[:byte| byteOrClosure value: byte value: s secondByte]].
							[3] -> [end := self endPC - 2.
									[:byte|
									s pc <= end
									and: [byteOrClosure
											value: byte
											value: s secondByte
											value: s thirdByte]]].
							[4] -> [end := self endPC - 3.
									[:byte|
									s pc <= end
									and: [byteOrClosure
											value: byte
											value: s secondByte
											value: s thirdByte
											value: s fourthByte]]] }]
					ifFalse: [[:instr | instr = byteOrClosure]])
"
SystemNavigation default browseAllSelect: [:m | m scanFor: 134]
"