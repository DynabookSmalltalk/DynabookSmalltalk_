private
labeledClassnames: classNames
	| methodClassification |
	methodClassification := Dictionary new.
	items do: [:def | def isMethodDefinition ifTrue: [
		(methodClassification at: def className ifAbsentPut: [Set new])
			add: (def classIsMeta ifFalse: [$i] ifTrue: [$c])]].
	^ classNames collect: [:className |
		String streamContents: [:s |
			s nextPutAll: className; space.
			(methodClassification at: className)
				do: [:each | each = $i
					ifTrue: [s nextPutAll: '*inst']
					ifFalse: [s nextPutAll: '*class']]
				separatedBy: [s nextPut: $,]]]
