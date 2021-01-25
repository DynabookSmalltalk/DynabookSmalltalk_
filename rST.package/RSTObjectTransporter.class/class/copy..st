instance creation
copy: anObject 
	"creates a Transporter for a copy of anObject "
	^ self new initializeObject: anObject type: #copy