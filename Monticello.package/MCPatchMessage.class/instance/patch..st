accessing
patch: aPatch
	stream ifNil: [stream := WriteStream on: (String new: 100)].
	aPatch operations sorted
		do: [:op | op applyTo: self]