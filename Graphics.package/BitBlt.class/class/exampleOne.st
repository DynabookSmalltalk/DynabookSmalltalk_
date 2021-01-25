examples
exampleOne
	"This tests BitBlt by displaying the result of all sixteen combination rules that BitBlt is capable of using. (Please see the comment in BitBlt for the meaning of the combination rules). This only works at Display depth of 1. (Rule 15 does not work?)"
	| pathClass path displayDepth destination |

	(Display supportsDisplayDepth: 1)
		ifTrue:
			[displayDepth := Display depth.
			 Display newDepth: 1.
			 destination := Display]
		ifFalse:
			[destination := Form extent: 480 @ 400 depth: 1].

	(Smalltalk hasClassNamed: #Path)
		ifTrue: [pathClass := Smalltalk at: #Path]
		ifFalse: [^self inform: 'MVC class Path not present in this image'].
	path := pathClass new.
	0 to: 3 do: [:i | 0 to: 3 do: [:j | path add: j * 100 @ (i * 75)]].
	destination fillWhite.
	path := path translateBy: 60 @ 40.
	1 to: 16 do:
		[:index |
		BitBlt
			exampleOn: destination
			at: (path at: index)
			rule: index - 1
			fillColor: nil].

	destination ~~ Display ifTrue:
		[destination displayOn: Display at: 0 asPoint].
	[Sensor anyButtonPressed] whileFalse: [].
	displayDepth ifNotNil: [Display newDepth: displayDepth].

	"BitBlt exampleOne"