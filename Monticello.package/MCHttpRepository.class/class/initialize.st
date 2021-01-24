class initialization
initialize
	self unload.
	(ServiceRegistry current serviceWithId: #browserMethodMenu) services add: self browseMethodRevisionsService.
	(ServiceRegistry current serviceWithId: #browserClassMenu) services add: self browseClassRevisionsService