reading
uint8At: addr
	"TODO: do endian conversion here"
	| word |
	word := segment at: addr + 3 // 4.
	^word >> (8 * (addr + 3 \\ 4)) bitAnd: 16rFF.