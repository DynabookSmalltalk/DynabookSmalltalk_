construction
addStayUpIcons
	| title closeBox pinBox |
	title := submorphs
				detect: [:ea | ea hasProperty: #titleString]
				ifNone: [
					"Called too soon. Will add stay-up icons when title is added."
					self setProperty: #needsTitlebarWidgets toValue: true.
					^ self].
	closeBox := SystemWindowButton new target: self;
				 actionSelector: #delete;
				 color: Color transparent;
				 setBalloonText: 'close this menu' translated;
				 borderWidth: 0.
	self class closeBoxImage scaleIconToDisplay in: [:icon |
		closeBox labelGraphic: icon; extent: icon extent].
	pinBox := SystemWindowButton new target: self;
				 actionSelector: #stayUp:;
				 arguments: {true};
				 color: Color transparent;
				 setBalloonText: 'keep this menu up' translated;
				 borderWidth: 0.
	self class pushPinImage scaleIconToDisplay in: [:icon |
		pinBox labelGraphic: icon; extent: icon extent].
		
	title
		addMorphFront: closeBox;
		addMorphBack: pinBox.
		
	self setProperty: #hasTitlebarWidgets toValue: true.
	self removeProperty: #needsTitlebarWidgets.
	self removeStayUpItems