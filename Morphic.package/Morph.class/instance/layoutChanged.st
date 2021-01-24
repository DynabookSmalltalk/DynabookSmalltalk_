layout
layoutChanged
	"Notify my dependents (such as owner and submorphs) about a possible layout change after, for example, a change in position or extent. As a result, the layout will be re-computed for this morph and all its submorphs on the next #fullBounds call."

	"0) Skip duplicate notifications. Only once after every successful layout computation."
	fullBounds ifNil: [^self].
	
	"1) Clear layout caches."
	fullBounds := nil.
	self layoutPolicy ifNotNil:[:layout | layout flushLayoutCache].
	
	"2) Notify all dependents. Note that we do not send #ownerChanged to our submorphs now because we have to ensure that each submorph gets notified *exactly once* right before layout computation. See #doLayoutIn:."
	self owner ifNotNil: [:o | self disableLayout ifFalse: [o layoutChanged]].