submenu - projects
parentProjectMenuItemOn: menu

	menu addUpdatingItem: [ :item |
		item
			contents: 'Enter Parent Project' translated;
			help: 'Return to the parent project' translated;
			target: self;
			selector: #enterParentProject;
			enablementSelector: #canEnterParentProject ]