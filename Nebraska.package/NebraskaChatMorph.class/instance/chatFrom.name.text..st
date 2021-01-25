as yet unclassified
chatFrom: ipAddress name: senderName text: text

	| initialText attrib |

	recipientForm ifNil: [
		initialText := senderName asText allBold.
	] ifNotNil: [
		attrib := TextAnchor new anchoredMorph: recipientForm "asMorph".
		initialText := (String value: 1) asText.
		initialText addAttribute: attrib from: 1 to: 1.
	].
	self appendMessage: initialText,' - ',text,String cr.
	NebraskaCommunicatorMorph playArrivalSound.


