emphasis
alignmentAt: characterIndex ifAbsent: aBlock
	| attributes emph |
	self size = 0 ifTrue: [^aBlock value].
	emph := nil.
	attributes := runs atPin: characterIndex.
	attributes do:[:att | (att isKindOf: TextAlignment) ifTrue:[emph := att]].
	emph ifNil: [ ^aBlock value ].
	^emph alignment