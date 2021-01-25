rules-parsing
block =

	"["
		(	(":" identifier)+ "|"
		|	empty
		)

		(	"|" identifier* "|"
		|	empty
		)

		(	expr ("." expr)* ("." "^" expr | empty)
		|	"^" expr
		|	empty
		)

		(	"."
		|	empty
		)

	"]"