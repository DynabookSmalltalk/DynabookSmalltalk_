rules-meta
listOf :rule :delim =

		apply(rule):x (token(delim) apply(rule))*:xs -> [xs addFirst: x; yourself]
	|	empty -> [#()]