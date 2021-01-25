as yet unclassified
newItem: newMorph

	| theFridge fridgeWorld trialRect |

	theFridge := Project named: 'Fridge'.
	theFridge ifNil: [^self newItems add: newMorph].
	fridgeWorld := theFridge world.
	trialRect := fridgeWorld randomBoundsFor: newMorph.
	fridgeWorld 
		addMorphFront: (newMorph position: trialRect topLeft);
		startSteppingSubmorphsOf: newMorph
