other
names
	"Return a collection of all known names for this color.
	These are Symbol that can be used as message send to Color."

	^ RGBToNames at: rgb ifAbsent: [Array new]