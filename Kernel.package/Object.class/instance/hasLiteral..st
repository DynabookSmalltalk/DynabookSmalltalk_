literals
hasLiteral: literal

	^ self hasLiteralSuchThat: [:lit | lit literalEqual: literal]