attributes
extent: newExtent  depth: newDepth
	"modify the extent and/or depth of the shared world"
	clients do: [ :client |
		client extent: newExtent depth: newDepth ].
	world extent: newExtent.

	worldDepth := newDepth.