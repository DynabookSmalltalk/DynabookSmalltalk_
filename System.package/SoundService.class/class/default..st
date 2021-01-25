accessing
default: aClassOrNil
	"See #default. This app registry returns instances instead of classes. Yet, make sure to only store classes so that always fresh instances will be returned."
	
	^ super default: (aClassOrNil ifNotNil: [:obj |
		obj isBehavior
			ifTrue: [obj]
			ifFalse: [obj class]])