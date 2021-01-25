instance creation
create
	"doIt: [self create apply.]"

	| themeName |
	themeName := 'Trim (dark)'.
	^ (self named: themeName) in: [:theme |
		theme merge: (self named: 'Squeak') overwrite: true.
		theme name: themeName.

		"General morph stuff."
		theme
			set: #keyboardFocusColor for: #Morph to: self blue;
			set: #keyboardFocusWidth for: #Morph to: 2.

		theme set: #background for: #MorphicProject to: self backgroundForm.

		self addFonts: theme.
		self addWindowColors: theme.
		self addSyntaxHighlighting: theme.
		self addMenusAndDockingBars: theme.
		self addDialogs: theme.
		self addButtons: theme.
		self addScrollables: theme.
		self addToolColors: theme.

		theme]