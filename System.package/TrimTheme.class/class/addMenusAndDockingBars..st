instance creation
addMenusAndDockingBars: theme

	theme
		set: #borderColor for: #MenuMorph to: self gray51;
		set: #borderWidth for: #MenuMorph to: 1;
		set: #borderStyle for: #MenuMorph to: BorderStyle simple;
		set: #color for: #MenuMorph to: self gray27;

		set: #titleBorderColor for: #MenuMorph to: (Color r: 0.6 g: 0.7 b: 1);
		set: #titleBorderWidth for: #MenuMorph to: 0;
		set: #titleBorderStyle for: #MenuMorph to: BorderStyle simple;
		set: #titleColor for: #MenuMorph to: Color transparent;
		set: #titleTextColor for: #MenuMorph to: self white;
		
		set: #lineColor for: #MenuMorph to: self gray51;
		set: #lineStyle for: #MenuMorph to: BorderStyle simple;
		set: #lineWidth for: #MenuMorph to: 1.
		
	theme
		set: #textColor for: #MenuItemMorph to: self white;
		set: #disabledTextColor for: #MenuItemMorph to: self gray128;
		set: #selectionColor for: #MenuItemMorph to: self gray102;
		set: #selectionTextColor for: #MenuItemMorph to: self white.
		
	"The world main docking bar."
	theme
		set: #logoColor for: #TheWorldMainDockingBar to: self white;
		set: #selectionLogoColor for: #TheWorldMainDockingBar to: self white.