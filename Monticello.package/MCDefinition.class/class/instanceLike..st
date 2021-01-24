as yet unclassified
instanceLike: aDefinition

	^(instances ifNil: [ instances := WeakSet new ])
		like: aDefinition
		ifAbsent: [ instances add: aDefinition ]