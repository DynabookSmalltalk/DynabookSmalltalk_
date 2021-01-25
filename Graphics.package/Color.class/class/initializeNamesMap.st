class initialization
initializeNamesMap
	"enable mapping a color to its name"
	"Color initializeNamesMap"

	RGBToNames := Dictionary new.
	self colorNames do: [:sym | (self perform: sym) addName: sym]