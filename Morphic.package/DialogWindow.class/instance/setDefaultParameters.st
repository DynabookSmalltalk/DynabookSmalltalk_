initialization
setDefaultParameters
	"change the receiver's appareance parameters"

	self
		color: (self userInterfaceTheme color ifNil: [Color white]);
		borderStyle: (self userInterfaceTheme borderStyle ifNil: [BorderStyle simple]) copy;
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color gray]);
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [1]);
		layoutInset: ((self class roundedDialogCorners and: [self class gradientDialog])
			"This check compensates a bug in balloon."
			ifTrue: [0] ifFalse: [self borderWidth negated asPoint]).

	Preferences menuAppearance3d ifTrue: [self addDropShadow].