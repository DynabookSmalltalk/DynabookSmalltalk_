rules
number =

	// this is an example of left recursion support

	number:n digit:d -> [n * 10 + d]
|	digit