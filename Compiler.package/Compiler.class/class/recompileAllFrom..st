utilities
recompileAllFrom: firstName 
	"Recompile all classes, starting with given name."
	| classesWithRecompileActions |
	classesWithRecompileActions := OrderedCollection new.

	Smalltalk allClassesDo: 
		[:class |
		class name >= firstName ifTrue: 
			[Transcript show: class name; cr.
			 class compileAll.
			 (class class includesSelector: #postRecompileAction) ifTrue:
				[classesWithRecompileActions addLast: class]]].

	classesWithRecompileActions do:
		[:classOrTrait| classOrTrait postRecompileAction]

	"Compiler recompileAllFrom: 'AAABodyShop'"