rules
symbolLiteral =

	// TODO: make this accept, e.g., #foo:bar:
	"#" nsName:s -> [{#App. #exactly. s storeString}]