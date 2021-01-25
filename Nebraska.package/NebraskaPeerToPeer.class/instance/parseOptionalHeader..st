receiving
parseOptionalHeader: aString
	"header used to be just an integer, was extended to have optional parameters (see makeOptionalHeader)"

	(((aString copyAfter: $() copyUpTo: $)) findTokens: $;) do: [:item |
		(item beginsWith: 'port:')
			ifTrue: [self receivedPort: (item copyAfter: $:)].
		(item beginsWith: 'tube:')
			ifTrue: [self receivedTube: (item copyAfter: $:)].]