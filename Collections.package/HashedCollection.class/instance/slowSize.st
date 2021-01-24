accessing
slowSize
	"Answer an upper bound of the number of elements in this collection. For regular collections, this can simply be the value of tally, but for collections that cannot maintain an exact value, like current weak collections, this has to be calculated on the fly."
	
	^tally