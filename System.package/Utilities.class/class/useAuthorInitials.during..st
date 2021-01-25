identification
useAuthorInitials: temporaryAuthorInitials during: aBlock

	| originalAuthorInitials |
	originalAuthorInitials := AuthorInitials.
	[ 
		AuthorInitials := temporaryAuthorInitials.
		aBlock value ]
		ensure: [ AuthorInitials := originalAuthorInitials ]
	