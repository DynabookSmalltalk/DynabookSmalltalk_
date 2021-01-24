accessing
hScrollBarPolicy: aSymbol
	"#always, #never, #whenNeeded"

	hScrollBarPolicy = aSymbol ifTrue: [^ self].
	self checkScrollBarPolicy: aSymbol.
	
	hScrollBarPolicy := aSymbol.
	self layoutChanged.