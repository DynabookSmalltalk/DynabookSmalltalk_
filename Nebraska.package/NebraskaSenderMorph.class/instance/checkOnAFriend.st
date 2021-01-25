as yet unclassified
checkOnAFriend

	| gateKeeperEntry caption choices resp |

	gateKeeperEntry := NebraskaGateKeeperMorph entryForIPAddress: self ipAddress.
	caption := 
'Last name: ' translated ,gateKeeperEntry latestUserName,
'\Last message in: ' translated ,gateKeeperEntry lastIncomingMessageTimeString,
'\Last status check at: ' translated ,gateKeeperEntry lastTimeCheckedString,
'\Last status in: ' translated ,gateKeeperEntry statusReplyReceivedString.
	choices := 'Get his status now\Send my status now' translated.
	resp := (PopUpMenu labels: choices withCRs) startUpWithCaption: caption withCRs.
	resp = 1 ifTrue: [
		gateKeeperEntry lastTimeChecked: Time totalSeconds.
		self sendStatusCheck.
	].
	resp = 2 ifTrue: [
		self sendStatusReply.
	].
