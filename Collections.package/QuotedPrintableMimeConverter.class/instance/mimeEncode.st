conversion
mimeEncode
	"Do conversion reading from dataStream writing to mimeStream. Break long lines and escape non-7bit chars."

	| currentCharacter line lineStream linePosition |
	currentCharacter := nil.
	[(line := dataStream nextLine) isNil] whileFalse: [
		lineStream := ReadStream on: line.
		linePosition := 0.
		
		[lineStream atEnd] whileFalse: [
			currentCharacter := lineStream next.
			self encodeChar: currentCharacter to: mimeStream.
			linePosition := linePosition + 1.
			linePosition = 73 ifTrue: [mimeStream nextPut: $=; crlf. linePosition := 0]].
		dataStream atEnd ifFalse: [mimeStream crlf]].
	^ mimeStream