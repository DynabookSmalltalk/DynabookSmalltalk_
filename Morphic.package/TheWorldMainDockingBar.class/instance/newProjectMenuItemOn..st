submenu - projects
newProjectMenuItemOn: menu

	Project allSubclasses do: [ :each |
		menu addItem: [ :item | 
			item
				contents: ('Create ', each name) translated;
				help: ('Create a new ', each name, ' and open a viewer for it.') translated;
				target: self;
				selector: #newProject:;
				arguments: { each } ] ] 