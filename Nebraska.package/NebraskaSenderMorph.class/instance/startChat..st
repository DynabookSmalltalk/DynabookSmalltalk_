as yet unclassified
startChat: toggleMode

	| chat r |

	(self valueOfProperty: #embeddedChatHolder) ifNotNil: [
		toggleMode ifFalse: [^self].
		^self killExistingChat
	].
	(NebraskaChatMorph doChatsInternalToBadge and: 
				[(self ownerThatIsA: NebraskaFridgeMorph) isNil]) ifTrue: [
		chat := NebraskaChatMorph basicNew
			recipientForm: userPicture; 
			initialize;
			setIPAddress: self ipAddress.
		chat
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			borderWidth: 2;
			insetTheScrollbars.
		r := (self addARow: {chat}) vResizing: #spaceFill.
		self rubberBandCells: false. "enable growing"
		self height: 350. "an estimated guess for allowing shrinking as well as growing"
		self world startSteppingSubmorphsOf: chat.
		self setProperty: #embeddedChatHolder toValue: r.
	] ifFalse: [
		chat := NebraskaChatMorph 
			chatWindowForIP: self ipAddress
			name: self userName 
			picture: userPicture 
			inWorld: self world.
		chat owner addMorphFront: chat.
	]
