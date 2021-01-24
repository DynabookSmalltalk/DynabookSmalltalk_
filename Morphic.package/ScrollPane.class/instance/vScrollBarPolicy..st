accessing
vScrollBarPolicy: aSymbol
	"#always, #never, #whenNeeded"

	vScrollBarPolicy = aSymbol ifTrue: [^ self].
	self checkScrollBarPolicy: aSymbol.
	
	vScrollBarPolicy := aSymbol.
	self layoutChanged.