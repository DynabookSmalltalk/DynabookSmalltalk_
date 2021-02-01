initialization
registerInOpenMenu
	"Register the receiver in the system's open menu"

	TheWorldMenu registerOpenCommand: 
		{ 'web browser' . { Scamper . #openAsMorph }. '"Scamper", a web browser' }.
