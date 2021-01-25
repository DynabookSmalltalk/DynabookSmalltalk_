query
allGlobalRefsWithout: classesAndMessagesPair 
	"Answer a set of symbols that may be refs to Global names. In some  
	sense we should only need the associations, but this will also catch, eg,  
	HTML tag types. This method computes its result in the absence of  
	specified classes and messages."

	| globalRefs absentClasses absentSelectors |
	globalRefs := IdentitySet new: CompiledMethod instanceCount.
	absentClasses := classesAndMessagesPair first.
	absentSelectors := classesAndMessagesPair second.
	"sd 29/04/03"
	Cursor execute
		showWhile: [self environment allClassesAndTraitsDo:
				[:cls | ((absentClasses includes: cls)
						ifTrue: [{}]
						ifFalse: [{cls. cls class}])
						do: [:cl | (absentSelectors isEmpty
								ifTrue: [cl selectors]
								ifFalse: [cl selectors copyWithoutAll: absentSelectors])
								do: [:sel | "Include all capitalized symbols for good 
									measure"
									(cl compiledMethodAt: sel) allLiteralsDo: [:m |
										((m isSymbol)
												and: [m size > 0
														and: [m first canBeGlobalVarInitial]])
											ifTrue: [globalRefs add: m].
										]]]]].
	^ globalRefs