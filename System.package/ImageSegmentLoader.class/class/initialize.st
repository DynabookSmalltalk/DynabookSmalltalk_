class initialization
initialize
	HeaderTypeMask := 3.
	HeaderTypeSizeAndClass := 0.	"3-word header"
	HeaderTypeClass := 1.				"2-word header"
	HeaderTypeFree := 2.					"free block"
	HeaderTypeShort := 3.				"1-word header"
	BytesInHeader := {
		HeaderTypeSizeAndClass -> 12.
		HeaderTypeClass -> 8.
		HeaderTypeShort -> 4.
	} as: Dictionary.
	"explicit list in case image has no/different compact classes"
	CompactClasses := {CompiledMethod. nil. Array. nil.
		LargePositiveInteger. Float. MethodDictionary. Association.
		Point. Rectangle. ByteString. nil.
		nil "was BlockCOntext; needs special handling". Context. nil. Bitmap. 
		nil. nil. nil. nil. nil. nil. nil. nil. nil. nil. nil. nil. nil. nil. nil}.
