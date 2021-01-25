drawing-support
showAt: pt invalidRects: updateRects
	updateRects do: [ :rect |
		self drawCommand: [ :exec |
			exec forceToScreen: rect ] ]