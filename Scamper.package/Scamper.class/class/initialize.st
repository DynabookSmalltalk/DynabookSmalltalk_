initialization
initialize
	"Initialize the class"

	self StartUrl: 'browser:about'.
	FileList registerFileReader: self.
	self registerInOpenMenu.
	WebBrowser register: self.
	
	Flaps registerQuad: { #Scamper. #newOpenableMorph. 'Scamper'. 'A web browser' } forFlapNamed: 'Tools'.