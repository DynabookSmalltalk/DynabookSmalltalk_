accessing
defaultSpecs

	DefaultSpecs ifNil: [DefaultSpecs := self new].
	^DefaultSpecs copy