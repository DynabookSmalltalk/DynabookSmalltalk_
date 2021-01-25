as yet unclassified
ensureListenerInCurrentWorld

	| w |
	w := self currentWorld.
	NebraskaListenerMorph allInstances 
		detect: [ :each | each world == w]
		ifNone: [NebraskaListenerMorph new open]