accessing
take: maxNumberOfElements
	"Returns maxNumberOfElements as a new collection or less if the collection is not large enough."

	^ self any: (maxNumberOfElements min: self size)