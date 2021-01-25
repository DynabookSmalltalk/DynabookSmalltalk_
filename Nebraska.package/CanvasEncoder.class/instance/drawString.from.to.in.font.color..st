drawing
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c
	| fontIndex str |
	fontIndex := self establishFont: (fontOrNil ifNil: [ TextStyle defaultFont ]).
	str := s asString copyFrom: firstIndex to: lastIndex.
	str isWideString ifTrue: [
		self sendCommand: {
			String with: CanvasEncoder codeMultiText.
			str asByteArray asString.
			self class encodeRectangle: boundsRect.
			self class encodeInteger: fontIndex.
			self class encodeColor: c
		}
	] ifFalse: [
		self sendCommand: {
			String with: CanvasEncoder codeText.
			str.
			self class encodeRectangle: boundsRect.
			self class encodeInteger: fontIndex.
			self class encodeColor: c
		}
	].
