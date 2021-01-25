rules
expr3 =

	expr2:x optIter(x):x
		(	$: nsName:n [temps add: n]	-> [{#Set. n. x}]
		|	empty								-> [x]
		)
|	":" nsName:n [temps add: n]			-> [{#Set. n. {#App. #anything}}]