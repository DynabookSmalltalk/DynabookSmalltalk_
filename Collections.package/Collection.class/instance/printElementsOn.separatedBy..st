printing
printElementsOn: aStream separatedBy: delimiter
	"Do not use #print: on the delemiter to have more control over the output. Strings get quoted, Characters get prefixed, etc."

	self
		do: [:element | aStream print: element]
		separatedBy: [aStream nextPutAll: delimiter asString].