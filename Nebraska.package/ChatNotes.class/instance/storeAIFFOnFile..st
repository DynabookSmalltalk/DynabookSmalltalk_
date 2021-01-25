file i/o
storeAIFFOnFile: file
	"In a better design, this would be handled by SequentialSound,
	but I figure you will need a new primitive anyway, so it can
	be implemented at that time."
	| sampleCount |
	sampleCount := recorder recordedSound sounds inject: 0 into: [ :sum :rsound |
		sum + rsound samples monoSampleCount
	].
	file nextPutAll: 'FORM' asByteArray.
	file nextInt32Put: (2 * sampleCount) + 46.
	file nextPutAll: 'AIFF' asByteArray.
	file nextPutAll: 'COMM' asByteArray.
	file nextInt32Put: 18.
	file nextNumber: 2 put: 1. "channels"
	file nextInt32Put: sampleCount.
	file nextNumber: 2 put: 16. "bits/sample"
	(AbstractSound new) storeExtendedFloat: (recorder samplingRate) on: file.
	file nextPutAll: 'SSND' asByteArray.
	file nextInt32Put: (2 * sampleCount) + 8.
	file nextInt32Put: 0.
	file nextInt32Put: 0.
	(recorder recordedSound sounds) do: [:rsound |
		1 to: (rsound samples monoSampleCount) do: [:i |
			| s |
			s := rsound samples at: i.
			file nextPut: ((s bitShift: -8) bitAnd: 16rFF).
			file nextPut: (s bitAnd: 16rFF)]].