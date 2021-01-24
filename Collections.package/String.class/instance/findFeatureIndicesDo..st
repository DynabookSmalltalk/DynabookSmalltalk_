accessing - features
findFeatureIndicesDo: aBlock
	"Support for simple analysis of natural language in source code.
	
	In addition to whitespace separation like #findTokens:, also separate features using higher-level rules:
		(1) 'camelCase' -> #('camel' 'Case'),
		(2) 'UPPERCase' -> #('UPPER' 'Case'),
		(3) integer numbers such as 'MyModel55' -> #('My' 'Model' '55'), and 
		(4) operators such as '5 <= 4' -> #('5' '<=' '4').
	Other kinds of characters are tokenized as operators: '[state := 2]' -> #('[' 'state' ':=' '2' ']').
	
	This method works like #lineIndicesDo: and provides start/stop indices of tokens to the given aBlock to, for example, extract and normalize features (or tokens)."
		
	| last state char |
	state := 0. "0 = start, 1 = a, 2 = A, 3 = AA, 4 = num, 5 = op"
	last := 1. "last character index"
	
	1 to: self size do: [ :index |
		char := self at: index.
		
		char isLowercase
			ifTrue: [ "a"
				state < 3 ifTrue: [state := 1]. "*a -> a"
				state = 3 ifTrue: [
					"AAa -> A + Aa (camel case follows uppercase)"
					aBlock value: last value: index - 2.
					last := index - 1.
					state := 2].
				state > 3 ifTrue: [
					"+a -> + | a (letter follows non-letter)" 
					aBlock value: last value: index - 1.
					last := index.
					state := 1]] 
			ifFalse: [
				char isUppercase
					ifTrue: [ "A"
						state = 0
							ifTrue: [state := 2] "start -> A"
							ifFalse: [
								(state < 2) | (state > 3) ifTrue: [
									"*A -> * | A (uppercase begins, flush before)"
									aBlock value: last value: index - 1.
									last := index.
									state := 2] ifFalse: [
										"AA -> AA (uppercase continues)"
										state := 3]]]
					ifFalse: [	
						char isSeparator
							ifTrue: [ " "
								"skip whitespace"
								state > 0 ifTrue: [
									aBlock value: last value: index - 1.
									state := 0].
								last := index + 1]
							ifFalse: [
								
								char isDigit
									ifTrue: [ "num"
										state = 0
											ifTrue: [state := 4]
											ifFalse: [
											state ~= 4 ifTrue: [
												aBlock value: last value: index - 1.
												last := index.
												state := 4]]]
									ifFalse: [ "op"
										state = 0
											ifTrue: [state := 5]
											ifFalse: [
												state < 5 ifTrue: [
													aBlock value: last value: index - 1.
													last := index.
													state := 5]] ] ] ] ] ].
	last <= self size ifTrue: [
		aBlock value: last value: self size]