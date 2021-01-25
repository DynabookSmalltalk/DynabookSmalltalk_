rules
trans =

	{:t [t asLowercase asSymbol]:t ?[self class canUnderstand: t] apply(t):ans} -> [ans]
|	_