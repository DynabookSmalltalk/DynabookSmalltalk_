class initialization
installKeyDecodeTable
	"Create a decode table that swaps or duplicates some keys if the respective preference is set."

	KeyDecodeTable := Dictionary new.

	Preferences swapControlAndAltKeys 
		ifTrue: [ (Character allByteCharacters select: [:ea | ea isAlphaNumeric]) do:
				[ :c | self installSwappedKeyEntryFor: c ] ].
	Preferences duplicateAllControlAndAltKeys
		ifTrue: [ (Character allByteCharacters select: [:ea | ea isAlphaNumeric]) do:
				[ :c | self installDuplicateKeyEntryFor: c ] ].

	self flag: #toDeprecate. "mt: This mapping should be deprecated in the future."
	Preferences duplicateControlAndAltKeys 
		ifTrue: [ self defaultCrossPlatformKeys do:
				[ :c | self installDuplicateKeyEntryFor: c ] ].
