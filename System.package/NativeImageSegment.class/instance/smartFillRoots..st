read/write segment
smartFillRoots: dummy
	| refs known ours ww blockers |
	"Put all traced objects into my arrayOfRoots.  Remove some
that want to be in outPointers.  Return blockers, an
IdentityDictionary of objects to replace in outPointers."

	blockers := dummy blockers.
	known := (refs := dummy references) size.
	refs keys do: [:obj | "copy keys to be OK with removing items"
		(obj isSymbol) ifTrue: [refs removeKey: obj.  known := known-1].
		(obj class == PasteUpMorph) ifTrue: [
			obj isWorldMorph & (obj owner == nil) ifTrue: [
				(dummy project ~~ nil and: [obj == dummy project world]) ifFalse: [
					refs removeKey: obj.  known := known-1.
					blockers at: obj put:
						(StringMorph contents: 'The worldMorph of a different world')]]].
					"Make a ProjectViewMorph here"
		"obj class == Project ifTrue: [Transcript show: obj; cr]."
		(blockers includesKey: obj) ifTrue: [
			refs removeKey: obj ifAbsent: [known := known+1].  known := known-1].
		].
	ours := dummy project ifNotNil: [dummy project world] ifNil: [ActiveWorld].
	refs keysDo: [:obj |
			obj isMorph ifTrue: [
				ww := obj world.
				(ww == ours) | (ww == nil) ifFalse: [
					refs removeKey: obj.  known := known-1.
					blockers at: obj put: (StringMorph contents:
								obj printString, ' from another world')]]].
	"keep original roots on the front of the list"
	dummy rootObject do: [:rr | refs removeKey: rr ifAbsent: []].
	(self respondsTo: #classOrganizersBeRoots:) ifTrue: "an EToys extension"
		[self classOrganizersBeRoots: dummy].
	^dummy rootObject, refs keys asArray