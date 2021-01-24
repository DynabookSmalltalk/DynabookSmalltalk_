accessing
ascii
	"return a set containing all the ASCII characters"

	^Ascii ifNil: [ Ascii := self newFrom: ((1 to: 127) collect: [:code | code asCharacter]) ]