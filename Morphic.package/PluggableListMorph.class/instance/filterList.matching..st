filtering
filterList: someItems matching: aPattern
	"Filter someStrings according to aPattern. Prepend best matches in the result. Update the model-to-view map."
	
	| frontMatching substringMatching tmp |
	aPattern ifEmpty: [ ^ someItems ].
	someItems ifEmpty: [ ^ someItems ].
	
	frontMatching := OrderedCollection new.
	substringMatching := OrderedCollection new.
	
	self assert: modelToView isEmpty.
	self assert: viewToModel isEmpty.
	tmp := OrderedCollection new.
	
	someItems doWithIndex:
		[ :each :n | | foundPos |
		foundPos := self filterListItem: each matching: aPattern.
		foundPos = 1
			ifTrue:
				[ frontMatching add: each.
				modelToView at: n put: frontMatching size.
				viewToModel at: frontMatching size put: n ]
			ifFalse:
				[ foundPos > 1 ifTrue:
					[ substringMatching add: each.
					tmp add: n; add:  substringMatching size ] ] ].

	tmp pairsDo: [:modelIndex :viewIndex |
		modelToView at: modelIndex put: viewIndex + frontMatching size.
		viewToModel at: viewIndex + frontMatching size put: modelIndex].
	
	^ frontMatching, substringMatching