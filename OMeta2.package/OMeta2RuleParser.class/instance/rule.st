rules
rule =

	~(^space* nsName expr4 "=") <char*>:squeakCode -> [{#Squeak. squeakCode}]
|	&(^space* nsName):n rulePart(n):x ("," rulePart(n))*:xs spaces end
		-> [{#Rule. n. temps asSortedCollection. (OrderedCollection with: #Or with: x) addAll: xs; yourself}]