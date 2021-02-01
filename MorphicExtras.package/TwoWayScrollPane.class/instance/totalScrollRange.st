geometry
totalScrollRange

	"Return the entire scrolling range."
	^ ((scroller localSubmorphBounds ifNil: [^nil]) encompass: 0@0) extent

