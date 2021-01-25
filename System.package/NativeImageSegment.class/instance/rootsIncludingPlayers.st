read/write segment
rootsIncludingPlayers
	"Return a new roots array with more objects.  (Caller should store into rootArray.) Player (non-systemDefined) gets its class and metaclass put into the Roots array.  Then ask for the segment again."

| extras havePresenter players morphs existing |
userRootCnt ifNil: [userRootCnt := arrayOfRoots size].
extras := OrderedCollection new.
arrayOfRoots do: [:root | 
	(root isKindOf: Presenter) ifTrue: [havePresenter := root].
	(root isKindOf: PasteUpMorph) ifTrue: [
			root isWorldMorph ifTrue: [havePresenter := root presenter]].
	(root isKindOf: Project) ifTrue: [havePresenter := root world presenter]].
havePresenter ifNotNil: [
	havePresenter flushPlayerListCache.		"old and outside guys"
	morphs := IdentitySet new: 400.
	havePresenter associatedMorph allMorphsAndBookPagesInto: morphs.
	players := (morphs select: [:m | m player ~~ nil] 
				thenCollect: [:m | m player]) asArray.
	players := players select: [:ap | (arrayOfRoots includes: ap class) not
		& (ap class isSystemDefined not)].
	extras addAll: (players collect: [:each | each class]).
	extras addAll: (players collect: [:each | each class class]).
	extras addAll: morphs.	"Make then ALL roots!"
	].
existing := arrayOfRoots asIdentitySet.
extras := extras reject: [ :each | existing includes: each].
extras isEmpty ifTrue: [^ nil].	"no change"
	
		havePresenter := players := morphs := nil.
		^ arrayOfRoots, extras	"will contain multiples of some, but reduced later"