accessing
tail

	tail ifNil: [tail := OM2LazyStream for: stream withPos: pos + 1].
	^ tail