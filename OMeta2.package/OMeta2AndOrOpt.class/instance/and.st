rules
and =

	trans:x end setHelped -> [x]
|	transInside(#And):xs -> [xs addFirst: #And; yourself]