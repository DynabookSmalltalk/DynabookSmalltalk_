private
provisions
	^ provisions ifNil: [provisions := Set withAll: Environment current provisions] 