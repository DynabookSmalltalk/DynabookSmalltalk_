fileIn
declareAndPossiblyRename: classThatIsARoot
	| existing catInstaller |
	"The class just arrived in this segment.  How fit it into the Smalltalk dictionary?  If it had an association, that was installed with associationDeclareAt:."

	catInstaller := [
		classThatIsARoot superclass name == #Player 
			ifTrue: [classThatIsARoot category: Object categoryForUniclasses]
			ifFalse: [(classThatIsARoot superclass name beginsWith: 'WonderLandActor')
				ifTrue: [classThatIsARoot category: 'Balloon3D-UserObjects']
				ifFalse: [classThatIsARoot category: Object categoryForUniclasses]].
	].
	classThatIsARoot superclass addSubclass: classThatIsARoot.
	(Smalltalk includesKey: classThatIsARoot name) ifFalse: [
		"Class entry in Smalltalk not referred to in Segment, install anyway."
		catInstaller value.
		^ Smalltalk at: classThatIsARoot name put: classThatIsARoot].
	existing := Smalltalk at: classThatIsARoot name.
	existing xxxClass == ImageSegmentRootStub ifTrue: [
		"We are that segment!  Must ask it carefully!"
		catInstaller value.
		^ Smalltalk at: classThatIsARoot name put: classThatIsARoot].
	existing == false | (existing == nil) ifTrue: [
		"association is in outPointers, just installed"
		catInstaller value.
		^ Smalltalk at: classThatIsARoot name put: classThatIsARoot].
	"Conflict with existing global or copy of the class"
	(existing isKindOf: Class) ifTrue: [
		classThatIsARoot isSystemDefined not ifTrue: [
			"UniClass.  give it a new name"
			classThatIsARoot setName: classThatIsARoot baseUniclass chooseUniqueClassName.
			catInstaller value.	"must be after new name"
			^ Smalltalk at: classThatIsARoot name put: classThatIsARoot].
		"Take the incoming one"
		self inform: 'Using newly arrived version of ', classThatIsARoot name.
		classThatIsARoot superclass removeSubclass: classThatIsARoot.	"just in case"
		(Smalltalk at: classThatIsARoot name) becomeForward: classThatIsARoot.
		catInstaller value.
		^ classThatIsARoot superclass addSubclass: classThatIsARoot].
	self error: 'Name already in use by a non-class: ', classThatIsARoot name.
