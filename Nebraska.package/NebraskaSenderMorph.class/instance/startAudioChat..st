as yet unclassified
startAudioChat: toggleMode 
	| chat r |
	(self valueOfProperty: #embeddedAudioChatHolder) ifNotNil: 
			[toggleMode ifFalse: [^self].
			^self killExistingChat].
	chat := AudioChatGUI new ipAddress: self ipAddress.
	(self ownerThatIsA: NebraskaFridgeMorph) isNil 
		ifTrue: 
			[chat
				removeConnectButton;
				vResizing: #shrinkWrap;
				hResizing: #shrinkWrap;
				borderWidth: 2.	"we already know the connectee"
			r := (self addARow: { 
								chat}) vResizing: #shrinkWrap.
			self world startSteppingSubmorphsOf: chat.
			self setProperty: #embeddedAudioChatHolder toValue: r.
			self
				hResizing: #shrinkWrap;
				vResizing: #shrinkWrap]
		ifFalse: 
			[chat openInWorld: self world]