platform independent access
signedByteAt: index
	"Answer an 8-bit signed integer quantity from the given byte index."
	<primitive: 165>
	| byte |
	(byte := self at: index) <= 16r7F ifTrue: [ ^byte ].
	^byte - 16r100