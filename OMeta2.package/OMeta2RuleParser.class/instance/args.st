rules
args =

	$( listOf(#squeakExpression. '.'):ans ")" -> [ans]
|	~$( -> [#()]