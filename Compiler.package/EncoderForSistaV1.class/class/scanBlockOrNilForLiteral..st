scanning
scanBlockOrNilForLiteral: aLiteral
	"Answer a block argument for CompiledMethod>>#scanFor: that answers
	 if the method refers to the literal implicitly via a special bytecode.
	 If the literal is not accessible via a special bytecode, answer nil."
	| value hi lo unextended |

	"96-111	0110 iiii			Send Arithmetic Message #iiii (+ - < > <= >= = ~= * / \\ @ bitShift: // bitAnd: bitOr:)
	 112-119	01110 iii			Send Special Message #iii + 0 (at: at:put: size next nextPut: atEnd == class)"
	aLiteral isSymbol ifTrue:
		[value := 96 + ((Smalltalk specialSelectors indexOf: aLiteral ifAbsent: [^nil]) // 2).
		 ^[:byte| byte = value]].

	"80			01010000			Push 0
	 81			01010001			Push 1
	 232		11101000	iiiiiiii	Push Integer #iiiiiiii (+ Extend B * 256, where bbbbbbbb = sddddddd, e.g. -32768 = i=0, d=0, s=1)"
	aLiteral isInteger ifTrue:
		[aLiteral >= 0 ifTrue:
			[aLiteral <= 1 ifTrue:
				[value := aLiteral + 80.
				 ^[:byte| byte = value]].
			 aLiteral <= 255 ifTrue:
				[unextended := true. "Don't be fooled by extended cases with the same least significant byte!"
				 ^[:b1 :b2| | found |
					found := b1 = 232 and: [b2 = aLiteral and: [unextended]].
					unextended := b1 ~= 16rE1.
					found]]].
		 (aLiteral between: -32768 and: 32767) ifFalse: [^nil].
		 lo := aLiteral bitAnd: 255.
		 hi := (aLiteral bitShift: -8) bitAnd: 255.
		 ^[:b1 :b2 :b3 :b4| b1 = 16rE1 and: [b2 = hi and: [b3 = 232 and: [b4 = lo]]]]].

	"233		11101001	iiiiiiii	Push Character #iiiiiiii (+ Extend B * 256)"
	aLiteral isCharacter ifTrue:
		[(value := aLiteral asInteger) <= 255 ifTrue:
			[unextended := true. "Don't be fooled by extended cases with the same least significant byte!"
			 ^[:b1 :b2| | found |
				found := b1 = 233 and: [b2 = value and: [unextended]].
				unextended := b1 ~= 16rE1.
				found]].
		 ^value <= 65535 ifTrue:
			[lo := value bitAnd: 255.
			 hi := (value bitShift: -8) bitAnd: 255.
			 [:b1 :b2 :b3 :b4| b1 = 16rE1 and: [b2 = hi and: [b3 = 233 and: [b4 = lo]]]]]].

	"77			01001101			Push true
	 78			01001110			Push false
	 79			01001111			Push nil
	 88-91		010110 ii			Return Receiver/true/false/nil
	 93			01011101			BlockReturn nil"
	aLiteral == true ifTrue:
		[^[:byte| byte = 77 or: [byte = 89]]].
	aLiteral == false ifTrue:
		[^[:byte| byte = 78 or: [byte = 90]]].
	aLiteral == nil ifTrue:
		[^[:byte| byte = 79 or: [byte = 91 or: [byte = 93]]]].
	^nil