initialization
initialize
	"initialize the state of the receiver"
	| earMorph |
	super initialize.
	""
	
	self layoutInset: 8 @ 8.
	"earMorph := (EToyListenerMorph makeListeningToggle: true)  
	asMorph."
	earMorph := TextMorph new contents: 'Morphs
welcome
here';
				 fontName: Preferences standardEToysFont familyName size: 18;
				 centered;
				 lock.
	self addARow: {earMorph}.
	self setBalloonText: 'My presence in this world means received morphs may appear automatically' translated