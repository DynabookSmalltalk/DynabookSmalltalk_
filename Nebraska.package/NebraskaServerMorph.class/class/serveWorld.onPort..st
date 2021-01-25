as yet unclassified
serveWorld: aWorld onPort: aPortNumber

	| server |
	server := NebraskaServer serveWorld: aWorld onPort: aPortNumber.
	(self new) openInWorld: aWorld.
	^server
	"server acceptNullConnection"		"server acceptPhonyConnection."
