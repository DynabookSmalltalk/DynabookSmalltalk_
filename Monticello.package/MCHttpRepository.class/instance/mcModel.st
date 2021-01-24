*monticello
mcModel
	"Answer the object which can respond to #historyOf: and #originOf: or nil, if none."
	^ self isIndexed ifTrue: [self]