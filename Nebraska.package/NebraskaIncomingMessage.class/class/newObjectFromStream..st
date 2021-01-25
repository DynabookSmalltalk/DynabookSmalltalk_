as yet unclassified
newObjectFromStream: dataStream

	| newObject |

	[newObject := SmartRefStream objectFromStreamedRepresentation: dataStream upToEnd.]
		on: ProgressInitiationException
		do: [ :ex | 
			ex sendNotificationsTo: [ :min :max :curr |
				"self flashIndicator: #working."
			].
		].
	"self resetIndicator: #working."
	^newObject
