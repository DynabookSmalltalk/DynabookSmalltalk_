instance creation
invalid
	"Returns an invalid class reference to avoid the usage of nil."
	
	^ InvalidReference ifNil: [
		InvalidReference := self new
			setClassSymbol: #NonExistentClass
			classIsMeta: false
			environment: Environment default
			stringVersion: '<The Invalid Class Reference>']