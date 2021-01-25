rules-meta
optIter :x =

	"*"		-> [{#Many.  x}]
|	"+"		-> [{#Many1. x}]
|	"?" ~$[	-> [{#Opt. x}]
|	empty		-> [x]