accessing
normalizedRepositories
	"Find an existing instance of any active repository so that we use whatever name and password the user usually uses. If not found, answer a copy"
	^ repositories collect: [ : each | each normalized ]