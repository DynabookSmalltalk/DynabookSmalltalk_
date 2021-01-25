access
originalRoots
	"Return only the roots that the user submitted, not the ones we had to add."

	userRootCnt ifNil: [^ arrayOfRoots].
	^ arrayOfRoots copyFrom: 1 to: userRootCnt