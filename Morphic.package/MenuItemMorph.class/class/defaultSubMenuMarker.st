defaults
defaultSubMenuMarker

	^ MenuIcons subMenuMarker dyed: ((UserInterfaceTheme current get: #textColor for: self) ifNil: [Color black]).