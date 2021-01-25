*System-icon scaling
scaleIconToDisplay
	"Convenient way to scale icons up or down to match the current display scale factor. For performance reasons, does not return a copy if there is no scaling of the receiver necessary."

	| scaleFactor referenceExtent |
	scaleFactor := RealEstateAgent scaleFactor.
	referenceExtent := RealEstateAgent defaultIconExtent.
	
	"Scale down bigger icons to match the (scaled) reference extent. So you can use high-resolution icons that do not appear blurry."
	self extent > referenceExtent ifTrue: [
		^ scaleFactor > 1.0
			ifFalse: [self scaledToSize: referenceExtent]
			ifTrue: [self scaledToSize: (((referenceExtent * scaleFactor) roundTo: 8) min: self extent)]].
				
	"Scale up smaller icons."
	^ scaleFactor = 1.0
		ifTrue: [self "Smaller than the default is okay if no scaling."]
		ifFalse: [self scaledToSize: self extent * scaleFactor]