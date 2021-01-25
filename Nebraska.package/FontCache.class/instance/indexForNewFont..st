lookups
indexForNewFont: aFont
	"add aFont to the cache.  Return its index.  The receiver will sometimes choose an index that is already used; that means that aFont is replacing the other font"
	| index |
	index := fonts size atRandom.      "random is simpler to manage than anything else"
	fonts at: index put: aFont.
	^index