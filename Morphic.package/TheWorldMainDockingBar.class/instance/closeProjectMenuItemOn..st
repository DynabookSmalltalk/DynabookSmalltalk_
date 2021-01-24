submenu - projects
closeProjectMenuItemOn: menu

	menu addUpdatingItem: [ :item |
		item
			contents: 'Close This Project' translated;
			help: 'Close this project and return to parent one' translated;
			target: self;
			selector: #closeProject;
			enablementSelector: #canCloseProject ]