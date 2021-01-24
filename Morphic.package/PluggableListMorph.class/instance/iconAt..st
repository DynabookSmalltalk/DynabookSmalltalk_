list morph callbacks
iconAt: viewIndex

	^ getIconSelector ifNotNil: [model perform: getIconSelector with: (self modelIndexFor: viewIndex)]