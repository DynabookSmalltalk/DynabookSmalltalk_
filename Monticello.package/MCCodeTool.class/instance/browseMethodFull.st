menus
browseMethodFull
	"Create and schedule a full Browser and then select the current class and message, or just the current class if viewing a class definition."
	^ self selectedClassOrMetaClass ifNotNil: [ :cls |
		self selectedMessageName
			ifNil: [ToolSet browseClass: cls]
			ifNotNil: [:sel | ToolSet browse: cls selector: sel]]