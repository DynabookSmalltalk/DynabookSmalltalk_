reading
fromStream: aStream named: aName
	| changes |
	changes := ChangeSet scanFile: aStream from: 0 to: aStream size.
	aStream close.
	('Processing ', aName) 
		displayProgressFrom: 1
		to: changes size
		during:[:bar| | chgRec |
			1 to: changes size do:[:i|
				bar value: i.
				chgRec := changes at: i.
				self perform: chgRec type asSimpleSetter with: chgRec.
			].
		].