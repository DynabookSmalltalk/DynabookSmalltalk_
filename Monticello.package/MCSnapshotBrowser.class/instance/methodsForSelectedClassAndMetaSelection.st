accessing
methodsForSelectedClassAndMetaSelection
	^ self methodsForSelectedClass select:
		[ : each | each classIsMeta = self switchIsClass ]