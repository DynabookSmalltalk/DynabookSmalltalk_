comparing
<= anotherMethodOrClassReference

	classSymbol < anotherMethodOrClassReference classSymbol ifTrue: [^true].
	classSymbol > anotherMethodOrClassReference classSymbol ifTrue: [^false].
	classIsMeta = anotherMethodOrClassReference classIsMeta ifFalse: [^classIsMeta not].
	^ self species = anotherMethodOrClassReference species
		and: [methodSymbol <= anotherMethodOrClassReference methodSymbol]
