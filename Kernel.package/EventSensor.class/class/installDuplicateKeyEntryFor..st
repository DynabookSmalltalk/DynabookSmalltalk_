key decode table
installDuplicateKeyEntryFor: aPrintableCharacter
	"Updates the key-decode table, which maps between pairs of {character code . modifier code}.
	See the class comment for more information.
	The purpose of this change is to let ctrl+key act like cmd+key (Mac) or alt+key (linux/windows).
	It is especially usefull on windows VM where default feel is to use ctrl as shortcut (ctrl+C = copy, etc...).
	Note that the bitmask 16r9F removes the high bits, which subtracts 64 from the key code for (upper) $A to $Z and 96 for (lower) $a to $z. The VM sends non-printable control characters for [ctrl]+[A-Za-Z] in ASCII < 32, but the given character is expected to be ASCII >= 32 and thus printable. So we have to convert control characters to printable characters in this mapping table."

	| upper lower |
	upper := aPrintableCharacter asUppercase asInteger.
	lower := aPrintableCharacter asLowercase asInteger.
	
	KeyDecodeTable at: { lower bitAnd: 16r9F . 2 "ctrl" } put: { lower . 8 "cmd/alt" }.
	KeyDecodeTable at: { upper bitAnd: 16r9F . 2 bitOr: 1 "ctrl + shift" } put: { upper . 8 bitOr: 1 "cmd/alt + shift" }.