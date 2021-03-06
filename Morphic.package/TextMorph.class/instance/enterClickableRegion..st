editing
enterClickableRegion: evt
	| index isLink |
	evt hand hasSubmorphs ifTrue:[^false].
	paragraph ifNotNil:[
		index := (paragraph characterBlockAtPoint: evt position) stringIndex.
		isLink := (paragraph text attributesAt: index forStyle: paragraph textStyle) 
					anySatisfy:[:attr| attr mayActOnClick].
		isLink ifTrue: [
			evt hand showTemporaryCursor: Cursor webLink.
			^ true]].
	^ false
