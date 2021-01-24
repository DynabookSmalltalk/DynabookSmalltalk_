accessing
author
	"The author initials embedded in the filename."
	
	^(self versionName copyAfterLast: $-) copyUpTo: $.