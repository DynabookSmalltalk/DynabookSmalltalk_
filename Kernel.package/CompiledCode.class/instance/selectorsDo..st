scanning
selectorsDo: workBlock
	"Evaluate aBlock with all the message selectors sent by me. Duplicate selectors are possible."

	| encoderClass |
	self isQuick ifTrue: [^self].
	encoderClass := self encoderClass.
	self codeLiteralsDo:
		[:compiledCode | | scanner limit |
		limit := compiledCode size - 1.
		(scanner := InstructionStream on: compiledCode) scanFor:
			[:byte| | selector |
			(selector := scanner selectorToSendOrSelf) ~~ scanner ifTrue:
				[workBlock value: selector].
			((encoderClass isExtension: byte)
			 and: [scanner pc < limit]) ifTrue:
				[scanner pc: scanner pc + (encoderClass bytecodeSize: (compiledCode at: scanner pc + 2))].
			false "keep scanning"]]