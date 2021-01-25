testing
findRogueRootsAllMorphs: rootArray 
	"This is a tool to track down unwanted pointers into the segment.  If we don't deal with these pointers, the segment turns out much smaller than it should.  These pointers keep a subtree of objects out of the segment.
1) assemble all objects should be in seg:  morph tree, presenter, scripts, player classes, metaclasses.  Put in a Set.
2) Remove the roots from this list.  Ask for senders of each.  Of the senders, forget the ones that are in the segment already.  Keep others.  The list is now all the 'incorrect' pointers into the segment."

	| inSeg testRoots scriptEditors pointIn wld xRoots |
	Smalltalk garbageCollect.
	inSeg := IdentitySet new: 200.
	arrayOfRoots := rootArray.
	(testRoots := self rootsIncludingPlayers) ifNil: [testRoots := rootArray].
	testRoots do: 
			[:obj | 
			(obj isKindOf: Project) 
				ifTrue: 
					[inSeg add: obj.
					wld := obj world.
					inSeg add: wld presenter].
			(obj isKindOf: Presenter) ifTrue: [inSeg add: obj]].
	xRoots := wld ifNil: [testRoots] ifNotNil: [testRoots , (Array with: wld)].
	xRoots do: 
			[:obj | 
			"root is a project"

			obj isMorph 
				ifTrue: 
					[obj allMorphs do: 
							[:mm | 
							inSeg add: mm.
							mm player ifNotNil: [inSeg add: mm player]].
					obj isWorldMorph ifTrue: [inSeg add: obj presenter]]].
	scriptEditors := IdentitySet new.
	inSeg do: 
			[:obj | 
			obj isPlayerLike 
				ifTrue: 
					[scriptEditors addAll: (obj class tileScriptNames 
								collect: [:nn | obj scriptEditorFor: nn])]].
	scriptEditors do: [:se | inSeg addAll: se allMorphs].
	testRoots do: [:each | inSeg remove: each ifAbsent: []].
	"want them to be pointed at from outside"
	pointIn := IdentitySet new: 400.
	inSeg do: [:ob | pointIn addAll: (Utilities pointersTo: ob except: inSeg)].
	testRoots do: [:each | pointIn remove: each ifAbsent: []].
	pointIn remove: inSeg array ifAbsent: [].
	pointIn remove: pointIn array ifAbsent: [].
	inSeg do: 
			[:obj | 
			obj isMorph 
				ifTrue: 
					[pointIn remove: (obj instVarAt: 3)
						ifAbsent: 
							["submorphs"

							].
					"associations in extension"
					pointIn remove: obj extension ifAbsent: [].
					obj extension ifNotNil: 
							[obj extension otherProperties ifNotNil: 
									[obj extension otherProperties associationsDo: 
											[:ass | 
											pointIn remove: ass ifAbsent: []
											"*** and extension actorState"
											"*** and ActorState instantiatedUserScriptsDictionary ScriptInstantiations"]]]].
			obj isPlayerLike 
				ifTrue: [obj class scripts values do: [:us | pointIn remove: us ifAbsent: []]]].
	"*** presenter playerlist"
	self halt: 'Examine local variables pointIn and inSeg'.
	^pointIn