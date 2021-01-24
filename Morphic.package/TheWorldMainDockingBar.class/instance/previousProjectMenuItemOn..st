submenu - projects
previousProjectMenuItemOn: menu

	menu addUpdatingItem: [ :item |
		item
			contents: 'Enter Previous Project' translated;
			help: 'Return to the most-recently-visited project' translated;
			target: self;
			selector: #enterPreviousProject;
			enablementSelector: #canEnterPreviousProject ]