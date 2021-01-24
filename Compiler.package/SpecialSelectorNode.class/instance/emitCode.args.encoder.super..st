code generation
emitCode: stack args: nArgs encoder: encoder super: supered
	"Generate a special selector send.
	 A super send of a special selector must be handled like a normal send.
	 This is handled in MessageNode>>sizeCodeForValue: by mapping any
	 SpecialSelectorNodes used in super sends into normal SelectorNodes."
	supered ifTrue: [self invalidSuperSendError].
	stack pop: nArgs.
	encoder genSendSpecial: code numArgs: nArgs