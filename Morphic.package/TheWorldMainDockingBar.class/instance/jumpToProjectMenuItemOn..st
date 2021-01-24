submenu - projects
jumpToProjectMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Enter Project' translated;
			icon: MenuIcons smallProjectJumpIcon;
			subMenuUpdater: self
			selector: #updateJumpToProjectSubMenu: ]