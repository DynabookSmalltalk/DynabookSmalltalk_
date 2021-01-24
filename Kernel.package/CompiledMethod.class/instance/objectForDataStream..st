file in/out
objectForDataStream: refStrm
	"Reconfigure pragma. Example: #(#FFTPlugin #primitiveFFTTransformData 0 0). See FFT >> #pluginTransformData:."

	self primitive = 117 ifTrue: [(self literalAt: 1) at: 4 put: 0].