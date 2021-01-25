query
allCallsOnClass: aBehaviorOrBinding
	"Answer a sorted collection of all the methods that refer to aBehavior."
	
	| binding thisClass result |
	binding := aBehaviorOrBinding isBehavior
		ifTrue: [self environment bindingOf: aBehaviorOrBinding theNonMetaClass name]
		ifFalse: [aBehaviorOrBinding].
	thisClass := binding value.
	
	result := self 
		allCallsOn: binding
		fromBehaviors: self allBehaviors
		sorted: false.

	self environment allClassesDo: [:otherClass |
		(otherClass sharedPools includes: thisClass) ifTrue: [
			result add: (ClassReference class: otherClass) ] ].
	
	^ result sort