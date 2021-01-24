accessing
packageAndBranchName
	"The MC package name, possibly with branch name, embedded into this filename."
	
	^self versionName copyUpToLast: $-