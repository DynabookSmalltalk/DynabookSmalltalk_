construction
projectsMenuOn: aDockingBar

	aDockingBar addItem: [ :item |
		item
			contents: 'Projects' translated;
			addSubMenu: [ :menu | 
				self newProjectMenuItemOn: menu.
				menu addLine.
				self
					saveProjectMenuItemOn: menu;
					loadProjectMenuItemOn: menu.
				menu addLine.
				self
					parentProjectMenuItemOn: menu;
					previousProjectMenuItemOn: menu;
					jumpToProjectMenuItemOn: menu.
				menu addLine.
				self closeProjectMenuItemOn: menu ] ]
