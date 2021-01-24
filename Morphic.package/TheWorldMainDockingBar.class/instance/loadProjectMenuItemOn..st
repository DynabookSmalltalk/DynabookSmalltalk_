submenu - projects
loadProjectMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Load Project' translated;
			help: 'Load a project from a file and enter it on success' translated;
			target: self;
			selector: #loadProject ]