rules
expr2 =

	"~" expr2:x -> [{#Not. x}]
|	"&" expr2:x -> [{#Lookahead. x}]
|	expr1