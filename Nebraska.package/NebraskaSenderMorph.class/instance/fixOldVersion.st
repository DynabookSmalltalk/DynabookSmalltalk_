as yet unclassified
fixOldVersion

	| uName uForm uEmail uIP |
	uName := self userName.
	uForm := userPicture ifNil: [
		(self 
		findDeepSubmorphThat: [ :x | (x isKindOf: ImageMorph) or: [x isSketchMorph]] 
		ifAbsent: [self halt]) form.
	].
	uEmail := (fields at: #emailAddress) contents.
	uIP := self ipAddress.
	self
		userName: uName 
		userPicture: (uForm scaledToSize: 61@53)
		userEmail: uEmail 
		userIPAddress: uIP
