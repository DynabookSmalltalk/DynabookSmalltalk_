annotations
printAnnotations: requests on: aStream
	"Add a string for an annotation pane, trying to fulfill the annotation requests.
	These might include anything that
		Preferences defaultAnnotationRequests 
	might return. Which includes anything in
		Preferences annotationInfo
	To edit these, use:"
	"Preferences editAnnotations"

	requests do: [ :aRequest |
		aRequest == #timeStamp ifTrue: [ aStream nextPutAll: self timeStamp ].
		aRequest == #messageCategory ifTrue: [ aStream nextPutAll: self category ].
		aRequest == #requirements ifTrue: [
			self requirements do: [ :req |
				aStream nextPutAll: req ] separatedBy: [ aStream space ]].
	] separatedBy: [ aStream space ].