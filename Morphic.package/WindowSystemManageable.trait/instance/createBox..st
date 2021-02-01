as yet unclassified
createBox: aForm
	"create a button with a form to be used in the label area"
	
	| box |
	box := SystemWindowButton new.
	box color: Color transparent;
		 target: self;
		 useSquareCorners;
		 borderWidth: 0;
		 extent: self boxExtent.
	(aForm isKindOf: Form) ifTrue: [box labelGraphic: aForm scaleIconToDisplay.] ifFalse: [box addMorph: (CustomDrawMorph new drawBlock: aForm)].
	^ box