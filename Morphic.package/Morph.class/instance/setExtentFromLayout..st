layout
setExtentFromLayout: aPoint
	"Sets the extent for laying out children of the receiver. We avoid triggering #layoutChanged again. This implementation is based on #extent:."
	
	"self assert: self owner layoutComputed not."
	
	self flag: #compatibility. "mt: There are way too many morphs that use #extent: to implement their own layout strategy such as updating gradient fills and submorph positions AND TEXT MORPH PARAGRAPHS (!). So, we *must* call #extent: to trigger those layout updates. Since our owner has not yet computed its layout, we are fine performance-wise."
	self extent: aPoint.
	
	self flag: #alternative. "mt: The following code represents the desired implementation of this method."
	"(self extent closeTo: aPoint) ifTrue: [^ self].

	self invalidRect: self outerBounds.
	bounds := bounds topLeft extent: aPoint.
	
	self removeProperty: #dropShadow.
	self invalidRect: self outerBounds."