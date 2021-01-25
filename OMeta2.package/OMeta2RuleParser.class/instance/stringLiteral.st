rules
stringLiteral =

	"'" ($' $' -> [$'] | ~$' char)*:xs $' -> [{#App. #exactly. (String withAll: xs) storeString}]