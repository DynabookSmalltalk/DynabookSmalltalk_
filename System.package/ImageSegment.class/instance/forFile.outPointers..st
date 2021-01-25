testing
forFile: aFileName outPointers: outPointerArray
	"An accessor for testing to set up a new image segment to be in a state to load from aFileName.  After this send install to load."
	fileName := aFileName.
	state := #onFile.
	outPointers := outPointerArray