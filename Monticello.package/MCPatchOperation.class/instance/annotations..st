accessing
annotations: requests
	"Answer a string for an annotation pane, trying to fulfill the annotation requests.
	These might include anything that
		Preferences defaultAnnotationRequests 
	might return. Which includes anything in
		Preferences annotationInfo
	To edit these, use:"
	"Preferences editAnnotations"

	^String streamContents: [ :s | self printAnnotations: requests on: s ].