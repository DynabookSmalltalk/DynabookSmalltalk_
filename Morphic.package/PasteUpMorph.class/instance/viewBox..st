project state
viewBox: newViewBox 
	"I am now displayed within newViewBox; react."

	self isWorldMorph ifTrue: [
		(self viewBox isNil or: [self viewBox extent ~= newViewBox extent]) 
			ifTrue: [worldState canvas: nil].
		worldState viewBox: newViewBox].
	
	super position: newViewBox topLeft.
	
	fullBounds := bounds := newViewBox.