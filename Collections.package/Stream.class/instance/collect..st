enumerating
collect: block

	^ Generator on: [:g | 
		[self atEnd] whileFalse: [
			g yield: (self next ifNotNil: [:object | block value: object])]]