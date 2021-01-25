as yet unclassified
serveWorld: aWorld
	"Check to make sure things won't crash. See Mantis #0000519"
	^aWorld isSafeToServe ifTrue:[
		self serveWorld: aWorld onPort: NebraskaServer defaultPorts]
	