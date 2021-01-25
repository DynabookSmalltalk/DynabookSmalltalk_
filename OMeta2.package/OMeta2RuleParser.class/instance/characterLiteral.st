rules
characterLiteral =

	spaces $$ char:c -> [{#App. #exactly. c storeString}]