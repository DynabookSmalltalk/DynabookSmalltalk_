identification
useAuthorName: temporaryAuthorName during: aBlock

	| originalAuthorName |
	originalAuthorName := AuthorName.
	[ 
		AuthorName := temporaryAuthorName.
		aBlock value ]
		ensure: [ AuthorName := originalAuthorName ]
	