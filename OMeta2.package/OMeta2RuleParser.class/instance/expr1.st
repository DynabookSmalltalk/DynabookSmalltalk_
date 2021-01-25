rules
expr1 =

	(keyword('true') | keyword('false') | keyword('nil')):lit -> [{#App. #exactly. lit}]
|	application
|	semanticAction
|	semanticPredicate
|	characters
|	tokenSugar
|	stringLiteral
|	symbolLiteral
|	numberLiteral
|	characterLiteral
|	"{"  expr:e "}" -> [{#Form. e}]
|	"<"  expr:e ">" -> [{#ConsBy. e}]
|	"@<" expr:e ">" -> [{#IdxConsBy. e}]
|	"("  expr:e ")" -> [e]