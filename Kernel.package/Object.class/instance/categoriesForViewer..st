viewer
categoriesForViewer: aViewer
	"Answer a list of categories to offer in the given viewer"

	| aList instItem |
	aList := aViewer currentVocabulary categoryListForInstance: self ofClass: self class limitClass: aViewer limitClass.
	self isPlayerLike ifTrue:
		[self costume isWorldMorph ifFalse:
			[aList removeAllFoundIn: #(preferences display)].
		^ aList].
	instItem := ScriptingSystem nameForInstanceVariablesCategory.
	^ (aList includes: instItem)
		ifTrue:
			[aList]
		ifFalse:
			[ {instItem }, aList]