browse
browseAllCallsOnClass: aBehaviorOrBinding
	"Create and schedule a message browser on each method that refers to aBehavior."
	"self default browseAllCallsOnClass: Array"
	
	| behaviorName |
	behaviorName := aBehaviorOrBinding isBehavior
		ifTrue: [aBehaviorOrBinding theNonMetaClass name]
		ifFalse: [aBehaviorOrBinding key].
	^ self
		browseMessageList: [ self allCallsOnClass: aBehaviorOrBinding ]
		name: 'Users of ', behaviorName
		autoSelect: behaviorName