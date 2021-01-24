external settings
fetchExternalSettingsIn: aDirectory
	"Scan for settings file"
	"MCRepository fetchExternalSettingsIn: ExternalSettings preferenceDirectory"

	| stream |
	(aDirectory fileExists: self settingsFileName)
		ifFalse: [^self].
	stream := aDirectory readOnlyFileNamed: self settingsFileName.
	stream
		ifNotNil: [
			[Settings := ExternalSettings parseServerEntryArgsFrom: stream]
				ensure: [stream close]].
