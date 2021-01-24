geometry
localSubmorphBounds
	"Answer, in my coordinate system, the bounds of all my submorphs (or nil if no submorphs). We will cache this value for performance. The value is invalidated upon recieving #layoutChanged."

	^ localBounds ifNil: [localBounds := super submorphBounds]