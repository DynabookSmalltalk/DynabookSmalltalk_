initialization
openScaled

	| window tm |
	window := NetworkTerminalBorderMorph new
		minWidth: 100;
		minHeight: 100;
		borderWidth: 8;
		borderColor: Color orange;
		bounds: (0@0 extent: Display extent * 3 // 4).
	tm := BOBTransformationMorph new.
	tm useRegularWarpBlt: true.		"try to reduce memory used"
	window addMorphBack: tm.
	tm addMorph: self.
	window openInWorld.
	NebraskaNavigationMorph new 
		nebraskaBorder: window;
		nebraskaTerminal: self;
		openInWorld.