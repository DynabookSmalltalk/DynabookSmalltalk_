as yet unclassified
serveWorldButton

	| button |
	button := SimpleButtonMorph new.
	button target: NebraskaServerMorph.
	button actionSelector: #serveWorld.
	button arguments: #().
	button label: 'Share'.
	button color: Color yellow.
	^ button.
