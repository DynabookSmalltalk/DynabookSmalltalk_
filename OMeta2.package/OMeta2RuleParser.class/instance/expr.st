rules
expr =

	listOf(#expr4. '|'):xs -> [(OrderedCollection with: #Or) addAll: xs; yourself]