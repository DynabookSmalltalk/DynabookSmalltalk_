menus
menu: menu shifted: shifted 
	"added 'back' and 'forward' menu options: Aibek 4/18/99"
	| lines selections linePositions |
	lines _ 'back
forward
new URL
history
view source
inspect parse tree
go to start page
edit start page
bookmark' translated.
	linePositions _ #(2 4 6 ).
	selections _ #(#back #forward #jumpToNewUrl #displayHistory #viewSource #inspectParseTree #visitStartPage #editStartPage #bookmark ).
	downloadingProcess
		ifNotNil: 
			[lines _ lines , String cr , 'stop downloading' translated.
			linePositions _ linePositions , selections size asOrderedCollection.
			selections _ selections , #(#stopEverything )].
	menu
		labels: lines
		lines: linePositions
		selections: selections.
	^ menu