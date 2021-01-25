instance creation
exception: anException 
	"creates a Transporter for anException "
	^ self new initializeObject: anException type: #exception