*monticello
mcRevisions
	"Answer a collection of MCClassDefinitions for this Class, which are in the first Magma-backed repository in the list of repositories of my working-copy."
	^ self mcModel ifNotNil: [ : mcmodel | mcmodel revisionsOf: self asClassDefinition ]