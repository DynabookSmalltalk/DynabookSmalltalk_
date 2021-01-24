evaluating
collate: anObject with: another
	"Answer the collation order of anObject and another based on the property."
	^ baseSortFunction collate: (property value: anObject) with: (property value: another)