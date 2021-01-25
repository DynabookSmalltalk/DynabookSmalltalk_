encoding
encodeImage: form
	
	| t answer |

	form ifNil: [^''].
	t := Time millisecondsToRun: [answer := form encodeForRemoteCanvas].
	form boundingBox area > 5000 ifTrue: [
		NebraskaDebug at: #FormEncodeTimes add: {t. form extent. answer size}
	].
	^answer

	"HandMorph>>restoreSavedPatchOn: is one culprit here"

