repository-api
includesVersionNamed: aString 
	^ repositories anySatisfy: [ : each | [each includesVersionNamed: aString] on: Error do: [false]]