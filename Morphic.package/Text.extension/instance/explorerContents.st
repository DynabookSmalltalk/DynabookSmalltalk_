*Morphic-Explorer
explorerContents

	^ (self class allInstVarNames asOrderedCollection withIndexCollect: [:each :index |
		ObjectExplorerWrapper
			with: (self instVarAt: index)
			name: each
			model: self])