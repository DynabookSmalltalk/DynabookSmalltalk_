accessing
label: aString

	| oldLabel m |
	(oldLabel := self findA: StringMorph)
		ifNotNil: [oldLabel delete].
	m := StringMorph contents: aString font: TextStyle defaultFont.
	self extent: m extent + (self borderWidth + 6).
	m position: self center - (m extent // 2).
	self addMorph: m.
	m lock