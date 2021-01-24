versions
includesVersionNamed: aString
	"Subclasses may want to override for better performance."
	^ (self versionNamed: aString) notNil