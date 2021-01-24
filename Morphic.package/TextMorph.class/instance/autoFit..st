accessing
autoFit: trueOrFalse
	"Private! Please use #hResizing: and #vResizing:."
	
	"Whether I automatically adjust my size to fit text as it changes"
	
	self isAutoFit = trueOrFalse ifTrue: [^ self].
	self autoFitOnOff.