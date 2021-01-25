private
segmentFormatFrom: a32BitWord
	"The first two words of a segment array contain the image format version of the system upon which the segment was generated, along with a top byte that is either $d or $s (from the 'does' in #doesNotUnderstand:).  But this may be encoded either in big-endian or little-endian format.  Since endianness may or may not have been changed, determining what the segment format is takes care."
	| msc lsc |
	msc := Character value: ((a32BitWord bitShift: -24) bitAnd: 255).
	lsc := Character value: (a32BitWord bitAnd: 255).
	(('ds' includes: msc)
	 and: ['ds' includes: lsc]) ifTrue:
		[self error: 'ambiguous segment format'].
	('ds' includes: msc) ifTrue:
		[^a32BitWord bitAnd: 16rFFFFFF].
	^((a32BitWord bitShift: -24) bitAnd: 16rFF)
	+ ((a32BitWord bitShift: -8) bitAnd: 16rFF00)
	+ ((a32BitWord bitShift: 8) bitAnd: 16rFF0000)