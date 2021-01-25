*System-Finalization
finalizeValues
	"Finalize any values, which happen to stocked in our list, due to some weak references become garbage"

	| finalizer |
	self protected:
		[valueDictionary finalizeValues.
		 finalizer := executors.
		 executors := nil ].
	finalizer ifNotNil: [finalizer do: [ :each | each finalizeValues]]