as yet unclassified
rebuild

	| row filler fudge people maxPerRow insetY |

	updateCounter := self class updateCounter.
	self removeAllMorphs.
	(self addARow: {
		filler := Morph new color: Color transparent; extent: 4@4.
	}) vResizing: #shrinkWrap.
	self addARow: {
		(StringMorph contents: 'the Fridge' translated) lock.
		self groupToggleButton.
	}.
	row := self addARow: {}.
	people := self class fridgeRecipients.
	maxPerRow := people size < 7 ifTrue: [2] ifFalse: [3].	
		"how big can this get before we need a different approach?"
	people do: [ :each |
		row submorphCount >= maxPerRow ifTrue: [row := self addARow: {}].
		row addMorphBack: (
			groupMode ifTrue: [
				(each userPicture scaledToSize: 35@35) asMorph lock
			] ifFalse: [
				each veryDeepCopy killExistingChat
			]
		)
	].
	fullBounds := nil.
	self fullBounds.
	"htsBefore := submorphs collect: [ :each | each height]."

	fudge := 20.
	insetY := self layoutInset.
	insetY isPoint ifTrue: [insetY := insetY y].
	filler extent: 
		4 @ (self height - filler height * 0.37 - insetY - self borderWidth - fudge) truncated.

	"self fixLayout.
	htsAfter := submorphs collect: [ :each | each height].
	{htsBefore. htsAfter} explore."

