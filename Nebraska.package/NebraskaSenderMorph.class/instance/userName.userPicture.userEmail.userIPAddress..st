as yet unclassified
userName: aString userPicture: aFormOrNil userEmail: emailString userIPAddress: ipString

	| dropZoneRow |

	self setProperty: #currentBadgeVersion toValue: self currentBadgeVersion.
	userPicture := aFormOrNil ifNil: [
		(TextStyle default fontOfSize: 26) emphasized: 1; characterFormAt: $?
	].
	userPicture := userPicture scaledToSize: 61@53.
	self killExistingChat.
	self removeAllMorphs.
	self useRoundedCorners.
	self 
		addARow: {
			self inAColumn: {(StringMorph contents: aString) lock}
		}.
	dropZoneRow := self
		addARow: {
			self inAColumn: {userPicture asMorph lock}
		}.
	self establishDropZone: dropZoneRow.
	self
		addARow: {
			self textEntryFieldNamed: #emailAddress with: emailString
					help: 'Email address for this person'
		};
		addARow: {
			self textEntryFieldNamed: #ipAddress with: ipString
					help: 'IP address for this person'
		};
		addARow: {
			self indicatorFieldNamed: #working color: Color blue help: 'working' translated.
			self indicatorFieldNamed: #communicating color: Color green help: 'sending' translated.
			self buttonNamed: 'C' action: #startChat color: Color paleBlue 
								help: 'Open a written chat with this person' translated.
			self buttonNamed: 'T' action: #startTelemorphic color: Color paleYellow 
								help: 'Start telemorphic with this person' translated.
			self buttonNamed: '!' action: #tellAFriend color: Color paleGreen 
								help: 'Tell this person about the current project' translated.
			self buttonNamed: '?' action: #checkOnAFriend color: Color lightBrown 
								help: 'See if this person is available' translated.
			"self buttonNamed: 'A' action: #startAudioChat color: Color yellow 
								help: 'Open an audio chat with this person' translated."
			self buttonNamed: 'S' action: #startNebraskaClient color: Color white 
								help: 'See this person''s world (if he allows that)' translated.
		}.
	