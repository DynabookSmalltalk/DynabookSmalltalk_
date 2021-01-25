browse
browseClass: aBehaviorOrBinding
	"Browse the class (1) as given, (2) from its meta class, (3) from a class binding, (4) of a global variable as given, (5) of a global variable from its global binding."
	
	| objectOrClass classOrMetaclass targetClass |
	objectOrClass := aBehaviorOrBinding value.
	classOrMetaclass := objectOrClass isBehavior
		ifTrue: [objectOrClass]
		ifFalse: [objectOrClass class].
	targetClass := classOrMetaclass isMeta
			ifTrue: [classOrMetaclass theNonMetaClass]
			ifFalse: [classOrMetaclass].
	^ ToolSet browseClass: targetClass