initialization
rebuild

	| myServer toggle closeBox font |

	font := StrikeFont familyName: #Palatino size: 14.
	self removeAllMorphs.
	self setColorsAndBorder.
	self updateCurrentStatusString.
	toggle := SimpleHierarchicalListMorph new perform: (
		fullDisplay ifTrue: [#expandedForm] ifFalse: [#notExpandedForm]
	).
	closeBox := SimpleButtonMorph new borderWidth: 0;
			label: 'X' font: Preferences standardEToysButtonFont; color: Color transparent;
			actionSelector: #delete; target: self; extent: 14@14;
			setBalloonText: 'End Nebraska session' translated.

	self addARow: {
		self inAColumn: {closeBox}.
		self inAColumn: {
			UpdatingStringMorph new
				useStringFormat;
				target:  self;
				font: font;
				getSelector: #currentStatusString;
				contents: self currentStatusString;
				stepTime: 2000;
				lock.
		}.
		self inAColumn: {
			toggle asMorph
				on: #mouseUp send: #toggleFull to: self;
				setBalloonText: 'Show more or less of Nebraska Status' translated
		}.
	}.
	myServer := self server.
	(myServer isNil or: [fullDisplay not]) ifTrue: [
		^self world startSteppingSubmorphsOf: self
	].
	"--- the expanded display ---"
	self addARow: {
		self inAColumn: {
			UpdatingStringMorph new
				useStringFormat;
				target:  self;
				font: font;
				getSelector: #currentBacklogString;
				contents: self currentBacklogString;
				stepTime: 2000;
				lock.
		}.
	}.

	self addARow: {
		self inAColumn: {
			(StringMorph contents: '--clients--' translated) lock; font: font.
		}.
	}.

	myServer clients do: [ :each |
		self addARow: {
			UpdatingStringMorph new
				useStringFormat;
				target: each;
				font: font;
				getSelector: #currentStatusString;
				contents: each currentStatusString;
				stepTime: 2000;
				lock.
		}
	].
	self world startSteppingSubmorphsOf: self.