adding
addAll: aCollection

	aCollection do: [ :each |
		definitions put: each ]