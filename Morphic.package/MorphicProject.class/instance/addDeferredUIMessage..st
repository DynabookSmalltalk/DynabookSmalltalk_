scheduling & debugging
addDeferredUIMessage: valuableObject 
	"Arrange for valuableObject to be evaluated at a time when the user interface
	is in a coherent state."

	self flag: #discuss. "mt: Why are deferred UI messages shared among all Morphic projects? That's not the case for MVC projects..."
	WorldState addDeferredUIMessage: valuableObject