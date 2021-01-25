other
name
	"Return this color's name, or nil if it has no name."

	^ (RGBToNames at: rgb ifAbsent: [nil]) ifNotNil: [:names | names at: 1 ifAbsent: [nil]]