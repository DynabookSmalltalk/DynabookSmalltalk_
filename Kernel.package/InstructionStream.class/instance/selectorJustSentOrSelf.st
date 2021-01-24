scanning
selectorJustSentOrSelf
	"If this instruction follows a send, answer the send's selector, otherwise answer self."

	| method |
	method := self method.
	^method encoderClass selectorToSendOrItselfFor: self in: method at: self previousPc