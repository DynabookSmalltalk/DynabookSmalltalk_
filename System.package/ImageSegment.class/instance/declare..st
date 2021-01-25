fileIn
declare: classThatIsARoot

	| nameOnArrival |
	"The class just arrived in this segment.  How fit it into the Smalltalk dictionary?  If it had an association, that was installed with associationDeclareAt:."

	nameOnArrival := classThatIsARoot name.
	[self declareAndPossiblyRename: classThatIsARoot]
		on: AttemptToWriteReadOnlyGlobal do: [:ex | ex resume: true].
	nameOnArrival == classThatIsARoot name ifTrue: [^self].
	renamedClasses ifNil: [RecentlyRenamedClasses := renamedClasses := Dictionary new].
	renamedClasses at: nameOnArrival put: classThatIsARoot name.

