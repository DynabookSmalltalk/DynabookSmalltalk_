remembering & forgetting
forgetAllNamed: nameObject 
	"forget anObject"
	| named | 
			named _ self allNamed: nameObject.
			named
				do: [:object | self forget: object named: nameObject]