private
correctAgainstEnumerator: wordBlock continuedFrom: oldCollection
	"The guts of correction, instead of a wordList, there is a block that should take another block and enumerate over some list with it."

	| choices results maxChoices scoreMin |
	scoreMin := self size // 2 min: 3.
	maxChoices := 10.
	choices := oldCollection ifNil: [
		SortedCollection sortBlock: [ :x :y | x value > y value ] ].
	wordBlock
		ifNil: [ 
			results := OrderedCollection new.
			1 to: (maxChoices min: choices size) do: [ :i | results add: (choices at: i) key ] ]
		ifNotNil: [ 
			wordBlock
				value: [ :word | 
					| score |
					(score := self alike: word) >= scoreMin
						ifTrue: [ 
							choices add: (Association key: word value: score).
							choices size >= maxChoices
								ifTrue: [ scoreMin := (choices at: maxChoices) value ] ] ].
			results := choices ].
	^ results