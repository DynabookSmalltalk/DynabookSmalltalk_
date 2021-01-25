read/write segment
findStacks
	"Return an array of all the StackMorphs in this project."
	| guys stacks |
	guys := IdentitySet new.
	Smalltalk at: #StackMorph ifPresent:[:aClass|
		guys addAll: aClass withAllSubclasses.
	].
	stacks := OrderedCollection new.
	arrayOfRoots do: [:obj |
		(guys includes: obj class) ifTrue: [stacks add: obj]].
	^ stacks