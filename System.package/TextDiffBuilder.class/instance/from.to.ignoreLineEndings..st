initialize
from: xString to: yString ignoreLineEndings: aBoolean

	ignoreLineEndings := aBoolean.
	xLines := self split: xString asString.
	yLines := self split: yString asString.
	self findMatches