toolbuilder
buildWith: builder
	|  windowBuilder |

	windowBuilder := MCToolWindowBuilder builder: builder tool: self.
	self widgetSpecs do:
		[:spec | | send fractions offsets |
		send := spec first.
		fractions := (spec at: 2 ifAbsent: [#(0 0 1 1)]) copy.
		offsets := (spec at: 3 ifAbsent: [#(0 0 0 0)]) copy.
		
		fractions doWithIndex: [:numberOrSymbol :index |
			numberOrSymbol isSymbol
				ifTrue: [fractions at: index put: (self perform: numberOrSymbol)]].
		offsets doWithIndex: [:numberOrSymbol :index |
			numberOrSymbol isSymbol
				ifTrue: [offsets at: index put: (self perform: numberOrSymbol)]].
					
		windowBuilder frame: (LayoutFrame
			fractions: (fractions first @ fractions second corner: fractions third @ fractions fourth)
			offsets: (offsets first @ offsets second corner: offsets third @ offsets fourth)).
		windowBuilder perform: send first withArguments: send allButFirst].

	^ windowBuilder build
