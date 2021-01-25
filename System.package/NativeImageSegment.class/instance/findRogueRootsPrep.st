testing
findRogueRootsPrep
	"Part of the tool to track down unwanted pointers into the segment.  Break all owner pointers in submorphs, scripts, and viewers in flaps."

| wld players morphs |
wld := arrayOfRoots detect: [:obj | 
	obj isMorph ifTrue: [obj isWorldMorph] ifFalse: [false]] ifNone: [nil].
wld ifNil: [wld := arrayOfRoots detect: [:obj | obj isMorph] 
				ifNone: [^ self error: 'can''t find a root morph']].
morphs := IdentitySet new: 400.
wld allMorphsAndBookPagesInto: morphs.
players := wld presenter allExtantPlayers.	"just the cached list"
players do: [:pp | | scriptEditors |
	scriptEditors := pp class tileScriptNames collect: [:nn | 
			pp scriptEditorFor: nn].
	scriptEditors do: [:se | morphs addAll: se allMorphs]].
wld submorphs do: [:mm | 	"non showing flaps"
	(mm isKindOf: FlapTab) ifTrue: [
		mm referent allMorphsAndBookPagesInto: morphs]].
morphs do: [:mm | 	"break the back pointers"
	mm isInMemory ifTrue: [
	(mm respondsTo: #target) ifTrue: [
		mm nearestOwnerThat: [:ow | ow == mm target 
			ifTrue: [mm target: nil. true]
			ifFalse: [false]]].
	(mm respondsTo: #arguments) ifTrue: [
		mm arguments do: [:arg | arg ifNotNil: [
			mm nearestOwnerThat: [:ow | ow == arg
				ifTrue: [mm arguments at: (mm arguments indexOf: arg) put: nil. true]
				ifFalse: [false]]]]].
	mm eventHandler ifNotNil: ["recipients point back up"
		(morphs includesAllOf: (mm eventHandler allRecipients)) ifTrue: [
			mm eventHandler: nil]].
	"temporary, until using Model for PartsBin"
	(mm isMorphicModel) ifTrue: [
		(mm model isMorphicModel) ifTrue: [
			mm model breakDependents]].
	(mm isTextMorph) ifTrue: [mm setContainer: nil]]].
(Smalltalk includesKey: #Owners) ifTrue: [Smalltalk at: #Owners put: nil].
	"in case findOwnerMap: is commented out"
"self findOwnerMap: morphs."
morphs do: [:mm | 	"break the back pointers"
	mm isInMemory ifTrue: [mm privateOwner: nil]].
"more in extensions?"
