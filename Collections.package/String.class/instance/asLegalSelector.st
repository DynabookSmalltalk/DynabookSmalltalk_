converting
asLegalSelector
	| toUse |
	toUse := self select: [:char | char isAlphaNumeric].
	(toUse size = 0 or: [toUse first isLetter not])
		ifTrue: [toUse := 'v', toUse].
	^ toUse withFirstCharacterDownshifted