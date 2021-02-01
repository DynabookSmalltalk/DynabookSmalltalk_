private
allTextPlusMorphs

	^submorphs select: [ :each | each isKindOf: TextPlusMorph]

