code generation
sizeCode: encoder args: nArgs super: supered
	"Size a special selector send.
	 A super send of a special selector must be handled like a normal send.
	 This is handled in MessageNode>>sizeCodeForValue: by mapping any
	 SpecialSelectorNodes used in super sends into normal SelectorNodes."
	supered ifTrue: [self invalidSuperSendError].
	^encoder sizeSendSpecial: code numArgs: nArgs