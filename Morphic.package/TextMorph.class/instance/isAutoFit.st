accessing
isAutoFit
	"For migrating old instances only. See #initialize."
	
	^ autoFit ifNil: [autoFit := true]