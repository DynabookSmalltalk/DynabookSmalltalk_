subprojects
subProjects
	"Answer a list of all the subprojects  of the receiver. "
	
	^ (super subProjects, (world submorphs 
		select: [:m | (m isSystemWindow) and: [m model isKindOf: Project]]
		thenCollect: [:m | m model])) asSet asArray.