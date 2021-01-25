rules
expr4 =

	expr3*:xs -> [(OrderedCollection with: #And) addAll: xs; yourself]