utilities
recompileAll	"Compiler recompileAll"
	"Recompile all classes and traits in the system.
	 After recompilation invoke the postRecompileAction on any "

	| classesWithRecompileActions |
	classesWithRecompileActions := OrderedCollection new.
	Smalltalk allClassesAndTraits "This is unordered; I find that unsatisfactory and fragile, because
								    if there is a bug it could be difficult to reproduce. eem 10/8/2019"
		do: [:classOrTrait |
			classOrTrait compileAll.
			(classOrTrait class includesSelector: #postRecompileAction) ifTrue:
				[classesWithRecompileActions addLast: classOrTrait]] 
		displayingProgress:[:classOrTrait| 'Recompiling ', classOrTrait].

	classesWithRecompileActions do: [:classOrTrait| classOrTrait postRecompileAction]