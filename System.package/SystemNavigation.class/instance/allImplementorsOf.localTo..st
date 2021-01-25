query
allImplementorsOf: aSelector localTo: aClass 
	"Answer a sorted collection of all the methods that are named aSelector in, above, or below the given class."
	
	| result |
	result := OrderedCollection new.
	aClass theNonMetaClass withAllSuperAndSubclassesDoGently: [:class |
		(class includesSelector: aSelector) ifTrue: [
			result add: (MethodReference class: class selector: aSelector) ].
		(class class includesSelector: aSelector) ifTrue: [
			result add: (MethodReference class: class class selector: aSelector) ] ].
	^result sort