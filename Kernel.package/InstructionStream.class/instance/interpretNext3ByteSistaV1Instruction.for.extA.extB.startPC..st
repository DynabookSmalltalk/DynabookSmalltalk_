decoding - private - sista v1
interpretNext3ByteSistaV1Instruction: bytecode for: client extA: extA extB: extB startPC: startPC
	"Send to the argument, client, a message that specifies the next instruction.
	 This method handles the three-byte codes.
	 For a table of the bytecode set, see EncoderForSistaV1's class comment."

	| method byte2 byte3 literal |
	method := self method.
	byte2 := method at: pc.
	byte3 := method at: pc + 1.
	pc := pc + 2.

	"**	248	(2)	11111000 	iiiiiiii		mssjjjjj		Call Primitive #iiiiiiii + (jjjjj * 256) 
									m=1 means inlined primitive, no hard return after execution. 
									ss defines the unsafe operation set used to encode the operations. 
									(ss = 0 means sista unsafe operations, ss = 01 means lowcode operations, other numbers are not used)
									Lowcode inlined primitives may have extensions."
	bytecode = 248 ifTrue:
		[| primitiveSetSelector primitiveNumber |
		 byte3 < 128 ifTrue:
			[ "Maybe this should be restricted to the 13 bit primitiveNumber too..."
			 ^client callPrimitive: byte2 + (byte3 bitShift: 8)].
		 primitiveSetSelector := (byte3 bitShift: -5) bitAnd: 3.
		 primitiveNumber := byte2 + ((byte3 bitAnd: 31) bitShift: 8).
		 primitiveSetSelector = 0 ifTrue: "Sista inline primitives"
			[^client callInlinePrimitive: byte2 + (byte3 - 128 bitShift: 8)].
		 primitiveSetSelector = 1 ifTrue: "Lowcode inline primitives"
			[^client callLowcodeInlinePrimitive: byte2 + (byte3 - 128 bitShift: 8) extA: extA extB: extB].
		 "fall through to ^self unusedBytecode: client at: startPC below"].

	"*	249		11111001	xxxxxxxx	siyyyyyy	push Closure Compiled block literal index xxxxxxxx (+ Extend A * 256) numCopied yyyyyy receiverOnStack: s = 1 ignoreOuterContext: i = 1"
	bytecode = 249 ifTrue:
		[literal := method literalAt: (extA bitShift: 8) + byte2 + 1.
		 (byte3 noMask: 16rC0) ifTrue:
			[^client pushFullClosure: literal numCopied: byte3].
		 ^client
			pushFullClosure: literal
			numCopied: (byte3 bitAnd: 16r3F)
			receiverOnStack: (byte3 anyMask: 16r80)
			ignoreOuterContext: (byte3 anyMask: 16r40)].
	bytecode = 250 ifTrue:
		["**	250  11111010  eeiiikkk  jjjjjjjj  Push Closure Num Copied iii (+ExtA//16*8) Num Args kkk (+ ExtA\\16*8) BlockSize jjjjjjjj (+ExtB*256). ee = num extensions"
		 ^client
			pushClosureCopyNumCopiedValues: ((byte2 bitShift: -3) bitAnd: 7) + (extA // 16 bitShift: 3)
			numArgs: (byte2 bitAnd: 7) + (extA \\ 16 bitShift: 3)
			blockSize: byte3 + (extB bitShift: 8)].
	bytecode = 251 ifTrue:
		[^client pushRemoteTemp: byte2 inVectorAt: byte3].
	bytecode = 252 ifTrue:
		[^client storeIntoRemoteTemp: byte2 inVectorAt: byte3].
	bytecode = 253 ifTrue:
		[^client popIntoRemoteTemp: byte2 inVectorAt: byte3].
	"**	254		11111110	kkkkkkkk	jjjjjjjj		branch If Not Instance Of Behavior/Array Of Behavior kkkkkkkk (+ Extend A * 256, where Extend A >= 0) distance jjjjjjjj (+ Extend B * 256, where Extend B >= 0)"
	bytecode = 254 ifTrue: "The sign bit of extB inverts the operation.  Would like to have extB < -128, but this is good enough for now."
		[literal := method literalAt: (extA bitShift: 8) + byte2 + 1.
		 extB < 0 ifTrue: [^client branchIfInstanceOf: literal distance: (extB + 128 bitShift: 8) + byte3].
		 ^client branchIfNotInstanceOf: literal distance: (extB bitShift: 8) + byte3].
	^self unusedBytecode: client at: startPC