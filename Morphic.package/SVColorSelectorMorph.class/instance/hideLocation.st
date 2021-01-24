private
hideLocation
	"Hide the location morph and update the display."
	
	self locationMorph visible: false.
	self refreshWorld.