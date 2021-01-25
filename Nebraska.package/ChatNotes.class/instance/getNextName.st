file i/o
getNextName
	"Return the next name available.
	All names are of the form '#.name' and '#.aiff'."
	| dir num |

	dir := self audioDirectory.
	num := 1.
	[dir fileExists: (num asString, '.name')] whileTrue: [num := num + 1].
	^(num asString, '.')