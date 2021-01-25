display scale
scaleFactor
	"Use the default font height to calculate some factor. Better than nothing..."
	
	^ ScaleFactor ifNil: [ScaleFactor := (TextStyle defaultFont height / 14 "reference value")]