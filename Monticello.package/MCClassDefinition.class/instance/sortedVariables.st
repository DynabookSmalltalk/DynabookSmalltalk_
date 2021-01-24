accessing
sortedVariables
	"sort variables for comparison purposes"

	| orderDependents toSort |
	orderDependents := OrderedCollection new: variables size.
	toSort := OrderedCollection new.
	variables do: [ :variable |
		variable isOrderDependend
			ifTrue: [ orderDependents addLast: variable ]
			ifFalse: [ toSort addLast: variable ] ].
	toSort sort: [ :a :b | a name <= b name ].
	^orderDependents
		addAllLast: toSort;
		yourself