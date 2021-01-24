filtering
listFilterSet: aString
	"Set the filter term and select the first match."

	self filterTerm: aString.
	self changeModelSelection: (self listSize = 0 ifTrue: [0] ifFalse: [self modelIndexFor: 1]).