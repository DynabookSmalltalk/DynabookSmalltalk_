event handling
mouseUp: anEvent 
	"Restore target drop shadow if there was one. See #mouseDown:."
	
	self target ifNil: [^ self].
	self target fastFramingOn ifFalse: [
		(self valueOfProperty: #targetHadDropShadow ifAbsent: [false]) ifTrue: [self target hasDropShadow: true].
		self removeProperty: #targetHadDropShadow].