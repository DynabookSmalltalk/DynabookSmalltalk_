rules
nsName =

	firstAndRest(#nameFirst. #nameRest):xs -> [(String withAll: xs) asSymbol]
|	$_ -> [#anything]