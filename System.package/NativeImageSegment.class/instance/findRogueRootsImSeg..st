testing
findRogueRootsImSeg: rootArray
	"This is a tool to track down unwanted pointers into the segment.  If we don't deal with these pointers, the segment turns out much smaller than it should.  These pointers keep a subtree of objects out of the segment.
1) Break all owner pointers in submorphs and all scripts.
2) Create the segment and look at outPointers.
3) Remove those we expect.
4) Remember to quit without saving -- the owner pointers are smashed."

| newRoots suspects bag1 bag2 |
arrayOfRoots := rootArray.
[(newRoots := self rootsIncludingPlayers) == nil] whileFalse: [
	arrayOfRoots := newRoots].		"world, presenter, and all Player classes"
self findRogueRootsPrep.	"and free that context!"
Smalltalk garbageCollect.
self copyFromRoots: arrayOfRoots sizeHint: 0.

suspects := outPointers select: [:oo | oo isMorph].
suspects size > 0 ifTrue: [suspects inspect].
bag1 := Bag new.  bag2 := Bag new.
outPointers do: [:key | 
	(key isKindOf: Class) 
		ifTrue: [bag2 add: key class name]
		ifFalse: [(#(Symbol Point Rectangle True False String Float Color Form ColorForm StrikeFont Metaclass UndefinedObject TranslucentColor) includes: key class name)
			ifTrue: [bag2 add: key class name]
			ifFalse: [bag1 add: key class name]]].
"(bag sortedCounts) is the SortedCollection"
(StringHolder new contents: bag1 sortedCounts printString, '

', bag2 sortedCounts printString) 
	openLabel: 'Objects pointed at by the outside'.
self halt: 'Examine local variables pointIn and inSeg'.

"Use this in inspectors:
	outPointers select: [:oo | oo class == <a Class>].		"
