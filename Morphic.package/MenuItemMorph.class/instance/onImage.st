private
onImage
	"Return the form to be used for indicating an '<on>' marker"

	^ MenuIcons checkBoxOn dyed: (self userInterfaceTheme textColor ifNil: [Color black])