instance creation
addScrollables: theme
	"self create apply"
	
	"Sliders"
	theme
		set: #borderColor for: #Slider to: self gray76;
		set: #borderWidth for: #Slider to: 1;
		set: #color for: #Slider to: self gray61;
		set: #thumbBorderColor for: #Slider to: self gray61;
		set: #thumbBorderWidth for: #Slider to: 1;
		set: #thumbColor for: #Slider to: self gray128;
		set: #thumbShadowModifier for: #Slider to: [ [:c | c alpha: 0.7] ].
				
	"Scroll bars"
	theme
		set: #thumbBorderWidth for: #ScrollBar to: 1;
		set: #thumbColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: 0.2] ];
		"set: #pagingAreaColorModifier for: #ScrollBar to: [ [:c | self gray51] ];"
		set: #borderColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: 0.2] ].
	
	"Scroll panes (includes generic stuff for list widgets, tree widgets, and text widgets."
	theme
		set: #borderColor for: #ScrollPane to: self gray76;
		set: #borderWidth for: #ScrollPane to: 1;
		set: #borderStyle for: #ScrollPane to: BorderStyle simple;
		set: #color for: #ScrollPane to: self gray51.
		
	"List widgets"
	theme
		set: #textColor for: #PluggableListMorph to: self white;
		set: #selectionColor for: #PluggableListMorph to: self blue;
		derive: #multiSelectionColor for: #PluggableListMorph from: #PluggableListMorph at: #selectionColor do: [:c | c lighter];
		set: #selectionTextColor for: #PluggableListMorph to: self white;
		set: #filterColor for: #PluggableListMorph to: self orange;
		set: #filterTextColor for: #PluggableListMorph to: self white;
		set: #preSelectionModifier for: #PluggableListMorph to: [ [:c | c alpha: 0.3] ];
		set: #hoverSelectionModifier for: #PluggableListMorph to: [ [:c | c darker alpha: 0.3] ].
		
	"Tree widgets"
	theme		
		set: #higlightTextColor for: #SimpleHierarchicalListMorph to: self red;
		set: #lineColor for: #SimpleHierarchicalListMorph to: self gray168.
	
	"Text widgets"
	theme
		set: #textColor for: #PluggableTextMorph to: self white;
		set: #caretColor for: #PluggableTextMorph to: self white;
		set: #selectionColor for: #PluggableTextMorph to: (self blue alpha: 0.4);
		set: #unfocusedSelectionModifier for: #PluggableTextMorph to: [ [:c | self blue alpha: 0.3] ];
		set: #adornmentReadOnly for: #PluggableTextMorph to: self black;
		set: #adornmentRefuse for: #PluggableTextMorph to: self blue;
		set: #adornmentConflict for: #PluggableTextMorph to: self red;
		set: #adornmentDiff for: #PluggableTextMorph to: self green;
		set: #adornmentNormalEdit for: #PluggableTextMorph to: self orange;
		set: #adornmentDiffEdit for: #PluggableTextMorph to: self yellow;
		set: #frameAdornmentWidth for: #PluggableTextMorph to: 1.
	theme
		set: #balloonTextColor for: #PluggableTextMorphPlus to: self gray102.