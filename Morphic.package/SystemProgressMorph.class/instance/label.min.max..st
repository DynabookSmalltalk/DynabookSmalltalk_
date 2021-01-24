private
label: shortDescription min: minValue max: maxValue
	"For convenience. Do not change the current position."
	
	self
		position: self requestedPosition
		label: shortDescription
		min: minValue
		max: maxValue.
