instance creation
invalid
	"Creates an invalid method reference to avoid the usage of nil."
	
	^ InvalidReference ifNil: [
		InvalidReference := self new
			setClassSymbol: #NonExistentClass
			classIsMeta: false
			methodSymbol: #nonExistentSelector
			stringVersion: '<The Invalid Method Reference>']