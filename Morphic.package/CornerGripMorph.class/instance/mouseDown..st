event handling
mouseDown: anEvent 
	"Disable drop shadow to improve performance while resizing."

	super mouseDown: anEvent.

	self target ifNil: [^ self].
	self target fastFramingOn ifFalse: [
		self setProperty: #targetHadDropShadow toValue: target hasDropShadow.
		self target hasDropShadow: false].